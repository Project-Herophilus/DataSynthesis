package com.redhat.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.AbstractMap.SimpleEntry;
import java.util.Map.Entry;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.DLN;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataGeneratedDriversLicensesEntity;
import com.redhat.idaas.datasynthesis.models.RefDataApplicationEntity;
import com.redhat.idaas.datasynthesis.models.RefDataStatusEntity;
import com.redhat.idaas.datasynthesis.models.RefDataUsStatesEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class DriversLicenseNumberService extends RandomizerService<DataGeneratedDriversLicensesEntity> {
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

    @Transactional
    public List<DataGeneratedDriversLicensesEntity> generatedDriverLicenses(int count, String state)
            throws DataSynthesisException {
        List<DataGeneratedDriversLicensesEntity> results = new ArrayList<DataGeneratedDriversLicensesEntity>();
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        String format = null;
        RefDataUsStatesEntity stateEntity = null;
        if (state != null) {
            format = FORMAT_MAP.get(state);
            stateEntity = RefDataUsStatesEntity.findById(state);
        }
        for (int i = 0; i < count;) {
            DataGeneratedDriversLicensesEntity entity = new DataGeneratedDriversLicensesEntity();
            entity.setCreatedDate(createdDate);
            entity.setStatus(defaultStatus);
            entity.setRegisteredApp(app);
            if (state == null) {
                // generate a random DLN for a random state
                Entry<String, String> entry = FORMAT_LIST.get(rand.nextInt(FORMAT_LIST.size()));
                entity.setState(RefDataUsStatesEntity.findById(entry.getKey()));
                entity.setDln(randLicense(entry.getValue()));
            } else {
                entity.setState(stateEntity);
                entity.setDln(randLicense(format));
            }
            if (entity.safePersist()) {
                results.add(entity);
                i++;
            }
        }

        return results;
    }

    private String randLicense(String format) {
        CharacterIterator it = new StringCharacterIterator(format);
        StringBuffer sb = new StringBuffer();
 
        while (it.current() != CharacterIterator.DONE)
        {
            if (it.current() == '[') { // expect [A#] pattern, 9% to fill a fixed letter, 91% to fill a random number
                it.next(); //skip '['
                char letter = it.current();
                it.next(); //done letter
                it.next(); //skip '#'
                if (chance(9)) {
                    sb.append(letter);
                } else {
                    sb.append(randDigit());
                }
                it.next(); //skip ']'
                continue;
            }
            switch(it.current()) {
                case '#': sb.append(randDigit()); break;
                case '.': if (chance()) {sb.append(randDigit());} break;
                case '%': sb.append(randLetter()); break;
                case '*': sb.append(chance() ? randDigit() : randLetter()); break;
                default: sb.append(it.current());
            }
            it.next();
        }

        return sb.toString();
    }
    
    private char randDigit() {
        return (char)(rand.nextInt(10) + '0');
    }

    private char randLetter() {
        return (char)(rand.nextInt(26) + 'A');
    }

    private boolean chance(int percent) {
        return rand.nextInt(100) < percent;
    }

    private boolean chance() {
        return chance(50); // 50% chance
    }

    public List<DLN> retrieveRandomDriverLicenses(int count, String state) {
        Set<DataGeneratedDriversLicensesEntity> entities = null;
        if (state == null) {
            entities = findRandomRows(count);
        } else {
            entities = findRandomRows(count, "StateCode", state);
        }
        return entities.stream().map(e -> new DLN(e.getDln(), e.getState().getStateId(), "")).collect(Collectors.toList());
    }
}
