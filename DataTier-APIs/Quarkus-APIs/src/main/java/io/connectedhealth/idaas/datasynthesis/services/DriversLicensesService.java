package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
import java.util.AbstractMap.SimpleEntry;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.github.curiousoddman.rgxgen.RgxGen;
import io.connectedhealth.idaas.datasynthesis.dtos.DLN;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedDriversLicensesEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataDataGenTypesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataUsStatesEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class DriversLicensesService extends RandomizerService<DataGeneratedDriversLicensesEntity, DLN> {
    // format is based on https://www.mvrdecoder.com/content/drvlicformats.aspx
    // https://ntsi.com/drivers-license-format/ is outdated
    //
    // Placeholder # num, . optional num, * num or letter, % letter
    private static final Map<String, String> FORMAT_MAP = Stream.of(new SimpleEntry<>("AL", "#######."), 
            new SimpleEntry<>("AK", "#######"), new SimpleEntry<>("AZ", "%########"),
            new SimpleEntry<>("AR", "#########"), new SimpleEntry<>("CA", "%#######"),
            new SimpleEntry<>("CO", "#########"), new SimpleEntry<>("CT", "#########"),
            new SimpleEntry<>("DE", "#......"), new SimpleEntry<>("DC", "#######"),
            new SimpleEntry<>("FL", "%############"), new SimpleEntry<>("GA", "#########"),
            new SimpleEntry<>("HI", "H########"), new SimpleEntry<>("ID", "%%%######"),
            new SimpleEntry<>("IL", "%###########"), new SimpleEntry<>("IN", "##########"),
            new SimpleEntry<>("IA", "###%%####"), new SimpleEntry<>("KS", "K########"),
            new SimpleEntry<>("KY", "%########"), new SimpleEntry<>("LA", "0########"),
            new SimpleEntry<>("ME", "#######"), new SimpleEntry<>("MD", "%############"),
            new SimpleEntry<>("MA", "S########"), new SimpleEntry<>("MI", "%############"),
            new SimpleEntry<>("MN", "%############"), new SimpleEntry<>("MS", "#########"),
            new SimpleEntry<>("MO", "%#########"), new SimpleEntry<>("MT", "#############"),
            new SimpleEntry<>("NE", "%########"), new SimpleEntry<>("NV", "############"),
            new SimpleEntry<>("NH", "%%%#########"), new SimpleEntry<>("NJ", "%##############"),
            new SimpleEntry<>("NM", "#########"), new SimpleEntry<>("NY", "#########"),
            new SimpleEntry<>("NC", "############"), new SimpleEntry<>("ND", "%%%######"),
            new SimpleEntry<>("OH", "%%######"), new SimpleEntry<>("OK", "%#########"),
            new SimpleEntry<>("OR", "%######."), new SimpleEntry<>("PA", "########"),
            new SimpleEntry<>("RI", "[V#]######"), new SimpleEntry<>("SC", "######....."),
            new SimpleEntry<>("SD", "########."), new SimpleEntry<>("TN", "#######.."),
            new SimpleEntry<>("TX", "########"), new SimpleEntry<>("UT", "####......"),
            new SimpleEntry<>("VT", "#######[A#]"), new SimpleEntry<>("VA", "%########"),
            new SimpleEntry<>("WA", "%%%%%###**"), new SimpleEntry<>("WV", "#######%*#####"),
            new SimpleEntry<>("WI", "%#############"), new SimpleEntry<>("WY", "#########"))
            .collect(Collectors.toMap(SimpleEntry::getKey, SimpleEntry::getValue));

    private static final List<Map.Entry<String, String>> FORMAT_LIST = FORMAT_MAP.entrySet().stream()
            .collect(Collectors.toList());

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedDriversLicensesEntity.count();
        }
        return DataGeneratedDriversLicensesEntity.count((String) queryOpts[0],
                Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedDriversLicensesEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedDriversLicensesEntity.findAll();
        }
        return DataGeneratedDriversLicensesEntity.find((String) queryOpts[0],
                Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected DLN mapEntityToDTO(DataGeneratedDriversLicensesEntity e) {
        DLN dln = new DLN(e.getDln(), e.getState().getStateId(), null);
        dln.id = e.getDriversLicensesId();
        return dln;
    }

    @Transactional
    public List<DLN> generatedDriverLicenses(int count, Short typeId, boolean dryRun)
            throws DataSynthesisException {
        List<DLN> results = new ArrayList<DLN>();
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        List<RefDataDataGenTypesEntity> dlnTypes = null;
        if (typeId != null) {
            RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(typeId);
            dlnTypes = new ArrayList<RefDataDataGenTypesEntity>();
            dlnTypes.add(dataType);
        } else {
            PlatformDataAttributesEntity dlnDataAttribute = PlatformDataAttributesEntity.findByDataAttributeName("Drivers License Number");
            dlnTypes = RefDataDataGenTypesEntity.find("dataAttribute", dlnDataAttribute).list();
        }
        RgxGen[] rgxGens = new RgxGen[dlnTypes.size()];
        RefDataUsStatesEntity[] states = new RefDataUsStatesEntity[rgxGens.length];
        for (int i = 0; i < count;) {
            int selected = rand.nextInt(dlnTypes.size());
            RefDataDataGenTypesEntity dataType = dlnTypes.get(selected);
            RgxGen rgxGen = rgxGens[selected];
            if (rgxGen == null) {
                rgxGen = new RgxGen(dataType.getDefinition());
                rgxGens[selected] = rgxGen;
                states[selected] = RefDataUsStatesEntity.findById(dataType.getDataGenTypeDescription());
            }

            DataGeneratedDriversLicensesEntity entity = new DataGeneratedDriversLicensesEntity();
            entity.setCreatedDate(createdDate);
            entity.setStatus(defaultStatus);
            entity.setRegisteredApp(app);
            entity.setState(states[selected]);
            entity.setDln(rgxGen.generate(rand));
            entity.setDataGenType(dataType);

            if (dryRun || entity.safePersist()) {
                results.add(mapEntityToDTO(entity));
                i++;
            }
        }

        return results;
    }

    public List<DLN> retrieveRandomDriverLicenses(int count, Short typeId) {
        if (typeId == null) {
            return retrieveRandomData(count);
        } 
        
        RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(typeId);
        return retrieveRandomData(count, "DataGenTypeID", dataType);
    }

    public DLN retrieve(long id)  throws DataSynthesisException{
        DataGeneratedDriversLicensesEntity entity = DataGeneratedDriversLicensesEntity.findById(id);
        if (entity == null) {
            throw new DataSynthesisException("record does not exist");
        }
        return mapEntityToDTO(entity);
    }
}