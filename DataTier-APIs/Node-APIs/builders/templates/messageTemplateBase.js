
module.exports = {
    getTemplate(type) {
        templates = {
            "ADT": `MSH|^~\\&|${sending_application}|${sending_facility}|${receiving_application}|${receiving_facility}|${timestamp}|${security}|${messagetype}|${messagecontrolid}|${environment}|${version}
        EVN|${eventtype}|${timestamp}||||
        PID|${set_id}|${patientid}|${patientid_list}|${alternative_patientid}|${fullname}|${mothers_maiden_name}|${dt_birth}|${gender}||${ethnic_group}|${fullpatientaddress}|${country_code}|${home_phone}|${business_phone}|${primary_lang}|${marital_status}|${religion}|${patient_acct_num}|${ssn}|${drivers_license_num}
        PV1|${set_id}|${patient_class}|${location}|${admission_type}|${preadmit_num}|${prior_patient_loc}|${attending_physician}|${referring_physcian}|${consulting_physcian}|${hospital_service}||||${admit_source}|${ambulatory_status}|${vip_indicator}|${admitting_doctor}|${patient_type}|${visit_number}|${financial_class}||||||||||||||||||||||||${admit_date}|${discharge_date}||||||||
        AL1|${set_id}|${allergy_type_code}|${allergy_code_mnemonic}|${severity}|${reaction}|${id_date}
        ACC|${timestamp}|${accident_code}
        DG1|${set_id}|${coding_method}|${dg_code}|${description}|${diagnosis_timestamp}|${diagnosis_type}||||||||||||N
        GT1|${set_id}|${g_number}|${g_name}||${g_address}|${home_phone}||${g_dob}|${g_gender}|${g_type}|${g_relationship}|${ssn}||||${g_emp_name}|${g_emp_address}|${g_emp_phn}||ST|
        IN1|${set_id}|${hp_id}|${insurance_comp_id}|${ins_comp_name}|${ins_comp_addr}|${ins_comp_contact}|${ins_comp_phn}|||||${plan_effective_date}||${auth_info}||${insurer_name}|${patient_relationship}|${insured_dob}||||||||||||||||||||||||||`.replace(/[\n\r]/g, '\r'),
            "ORU": "",
            "VXU": ""
        }
        return templates[type]
    }
}