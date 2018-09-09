package travel.airportList.com;

public class AirportListDTO {
	private String ID; // 접속한 회원의 ID
	private String DEPARTURE;
	private String ARRIVAL;
	private String DEPARTURE_DATE;
	private String DEPARTURE_TIME;
	private String ARRIVAL_TIME;
	private String FLIGHT_NUMBER;
	private int TICKET;
	private String SEAT;
	private String PRICE;
	private String TOTAL_PRICE;
	private String AIRLINE;
	private String LNAME;
	private String FNAME;
	private String NATIONALITY;
	private String PHONE;
	private String EMAIL;
	private String ADDRESS;

	public AirportListDTO() {

	}
	public AirportListDTO(String ID,String dEPARTURE, String aRRIVAL, String dEPARTURE_DATE, String dEPARTURE_TIME,
			String aRRIVAL_TIME, String fLIGHT_NUMBER, int tICKET, String sEAT, String pRICE, String tOTAL_PRICE,
			String aIRLINE, String lNAME, String fNAME, String nATIONALITY, String pHONE, String eMAIL, String aDDRESS) {
		this.ID = ID;
		this.DEPARTURE = dEPARTURE;
		this.ARRIVAL = aRRIVAL;
		this.DEPARTURE_DATE = dEPARTURE_DATE;
		this.DEPARTURE_TIME = dEPARTURE_TIME;
		this.ARRIVAL_TIME = aRRIVAL_TIME;
		this.FLIGHT_NUMBER = fLIGHT_NUMBER;
		this.TICKET = tICKET;
		this.SEAT = sEAT;
		this.PRICE = pRICE;
		this.TOTAL_PRICE = tOTAL_PRICE;
		this.AIRLINE = aIRLINE;
		this.LNAME = lNAME;
		this.FNAME = fNAME;
		this.NATIONALITY = nATIONALITY;
		this.PHONE = pHONE;
		this.EMAIL = eMAIL;
		this.ADDRESS = aDDRESS;
	}

	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getDEPARTURE() {
		return DEPARTURE;
	}

	public void setDEPARTURE(String dEPARTURE) {
		DEPARTURE = dEPARTURE;
	}

	public String getARRIVAL() {
		return ARRIVAL;
	}

	public void setARRIVAL(String aRRIVAL) {
		ARRIVAL = aRRIVAL;
	}

	public String getDEPARTURE_DATE() {
		return DEPARTURE_DATE;
	}

	public void setDEPARTURE_DATE(String dEPARTURE_DATE) {
		DEPARTURE_DATE = dEPARTURE_DATE;
	}

	public String getDEPARTURE_TIME() {
		return DEPARTURE_TIME;
	}

	public void setDEPARTURE_TIME(String dEPARTURE_TIME) {
		DEPARTURE_TIME = dEPARTURE_TIME;
	}

	public String getARRIVAL_TIME() {
		return ARRIVAL_TIME;
	}

	public void setARRIVAL_TIME(String aRRIVAL_TIME) {
		ARRIVAL_TIME = aRRIVAL_TIME;
	}

	public String getFLIGHT_NUMBER() {
		return FLIGHT_NUMBER;
	}

	public void setFLIGHT_NUMBER(String fLIGHT_NUMBER) {
		FLIGHT_NUMBER = fLIGHT_NUMBER;
	}

	public int getTICKET() {
		return TICKET;
	}

	public void setTICKET(int tICKET) {
		TICKET = tICKET;
	}

	public String getSEAT() {
		return SEAT;
	}

	public void setSEAT(String sEAT) {
		SEAT = sEAT;
	}

	public String getPRICE() {
		return PRICE;
	}

	public void setPRICE(String pRICE) {
		PRICE = pRICE;
	}

	public String getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}

	public void setTOTAL_PRICE(String tOTAL_PRICE) {
		TOTAL_PRICE = tOTAL_PRICE;
	}

	public String getAIRLINE() {
		return AIRLINE;
	}

	public void setAIRLINE(String aIRLINE) {
		AIRLINE = aIRLINE;
	}

	public String getLNAME() {
		return LNAME;
	}

	public void setLNAME(String lNAME) {
		LNAME = lNAME;
	}

	public String getFNAME() {
		return FNAME;
	}

	public void setFNAME(String fNAME) {
		FNAME = fNAME;
	}

	public String getNATIONALITY() {
		return NATIONALITY;
	}

	public void setNATIONALITY(String nATIONALITY) {
		NATIONALITY = nATIONALITY;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
}
