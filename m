Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB9E8B365
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 21:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MC41vgcCXoV+FPhwYS6OjbCDx2YVI/Vc5X1SVX52+pw=; b=ifZQ3pBiqXpvba
	ni3w63wI+SFjxbHTv7ZHCn+icUc2bkLgGEPd489gEX6bZ5XQyWwuISsnZhaC9NtX4gVj/lm4OLNBW
	NZCsekmiQV1LKJyj5He1sf5Gx8P/sWJusbYiIPB6H/As8kQlQQRokrSEtUQ89XCtU0UCBGLH25H4S
	HF6Vozp3CSBqxLd25LrOihJ5UzOuHJcVqu4FBVPuWBb+1X6QJKtIbRkkUbp9CvktgXYfROJsEYu86
	XDxaywltmjPvuwYbepx/Qqg3vBuUPfxI6vb+k8fNVRXpPH4vrZm3j1JPMnWQVq6dnJg5faFz+f3vh
	l2a56msVRHHaduxLrumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNvb-00000007NIn-2xq5;
	Tue, 03 Feb 2026 21:27:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNvY-00000007NHV-3oUY
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 21:27:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilh2d2828816
	for <kvm-riscv@lists.infradead.org>; Tue, 3 Feb 2026 21:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=; b=Kb73YfIXSmTcR7d4
	RlyaDCniI7YeU7LMIO9bX4/1FnCN05gtV+1lh/rWKPjr6c6OUzuI/xzLCVjs0m5k
	BVtZATrWM9YXMJrXia7vyBObHcatr/A/fuaxqkHEvTpEoXVUBzzfoDEefeoh2h5i
	IGeg02PrcidCJhe7qU5Yg9jZUqQICqwhA0kZA4fjm5jzLMqB/KKILdOY1fwLiuBL
	3dNQYdGvr+1eq1hjkA5sc97Vsk7xialvB/2Z/AcWYKspTSSZXEKgnNY0g1IrftZn
	azWRE+0ywQMyOt8LuWtZHTRCwAzb1foz6f7Me+f8dGOl5/Z374ft2i5YEoM7A04e
	GhJ8Ug==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ndvgt53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 03 Feb 2026 21:27:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b799f7a603so372584eec.1
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Feb 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770154034; x=1770758834; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=;
        b=M20abPNhFfp2wcPgt/zmNg3dZDzBgzENgWuNXpXagWT0BUlBSExwkEJV5Cjwl6gjju
         JCZKJ7uSez9+MQJCs81ms2ZgAL/1qLPTu666wSOeT5nTp07vRQS/EKhZVQi2LJfDrLsL
         QndYNbQS+W57NHqEeBT16rQjoWfIwoyCVlPp3/FxSMOVKh1KzKpe3sePZhDDbZYaC2L9
         QSiOr7ur0qRezj9YWQVm1mcu29V5OEJ6wtI4gYU81ZNvLAsb/YDkLGZCbUa1fZxdvOb8
         BvMyAi2W9Fo02ck/QXeg/Etk7e2o+bO6M0iy2lQYa+M10G61j8xEKIDSnxUJXn2oZm31
         ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770154034; x=1770758834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=;
        b=iR9hoAb0cEVNR9o9yk5Mb+36jlG6C/mpUXOY0/9bd+iPxvs40Ohs//yohmfBrieons
         qampx8gN2qjgrgUcSXWo7d33nHDPXSXHd9IP8E0YI7HNw77+bybaNkMNeHpCf29qIPa2
         LnCdavCpOsjqHSOEeWczp8pun5Yn3KTGrrJKarloMIBt49UkJBlSrePi9ee0zxqIVdn4
         BIixUMc9y5ZXVVtLbunTkf2H7UL3azztZjp/2Gpj487uZFB2Kj4CT0FLepUinsPMxkLj
         BheVktpEdxqfAXn9nxJOekScH9NYxDPt28IUVumlXRiPUCs9D6tOWepVPACZ0mFJDm8G
         AGoA==
X-Forwarded-Encrypted: i=1; AJvYcCUZaRejOaIS4oXbkGSSaANO/MPuf9REed2wGgb1R9/bYjszVMZAh8wsm8j0duPU5sjgepfBIaM9INA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG0sqXaCCrBg5Lt5dNjeMpNuhaPqstO1Nt8g+McrU4KQAIu4GG
	yV/eFUCIrJmB9y31YIsfIkfAxlb41hEbYn0RkBU+7+pQbRwWMP2+O0J5BB19eAvJuAGaFwKqq9a
	Eiai9jfl2QvhWUup4TBk07dj8JcnHrSz+gJk1FO023jegh9KXe1nR+nudEhMqj7MPUOeq
X-Gm-Gg: AZuq6aJMk/cT368ltnL6Bab0w5CUcBF/GDyAJbCO5mWMdUQ5QH0PC/WDkSSVwi/gOMg
	0+9/F/s3lOR4Mpx+i4D7mMEX47fQG0iY7FLhnoohL1A1TFGgZcGiWUb3qunTkOIAwvZqwHVKS9V
	7fLs1NYfrbgAflMJXsGq4ezFtHU75h5RqdUXyhSJT/qyCWcJsj9+NTSWIjPOi8F5oriRP9gZEkH
	FzTqkp93r8oHkuztuLGxIzCqU2Uqv+P+uQZ6soCGdeUEazlBLbd4Sgp8oS2AIgnhgIuWkxfWtbk
	pOfe14OR2DXzH7KkQQdwcZx0I1JdVZRiUx9YLI+4Aw9dB/1o5ju5RAReO5WtePm696aj1l2qAQV
	lQRKUp+WytRXKh7SikBg=
X-Received: by 2002:a05:7301:6094:b0:2b7:5e35:fa9e with SMTP id 5a478bee46e88-2b83287e6e9mr528567eec.3.1770154033838;
        Tue, 03 Feb 2026 13:27:13 -0800 (PST)
X-Received: by 2002:a05:7301:6094:b0:2b7:5e35:fa9e with SMTP id 5a478bee46e88-2b83287e6e9mr528545eec.3.1770154033326;
        Tue, 03 Feb 2026 13:27:13 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832e4cd26sm463464eec.12.2026.02.03.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:27:12 -0800 (PST)
Date: Tue, 3 Feb 2026 15:27:10 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: radim.krcmar@oss.qualcomm.com, ajones@ventanamicro.com, alex@ghiti.fr,
        anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
        corbet@lwn.net, guoren@kernel.org, kvm-riscv@lists.infradead.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
        rkrcmar@ventanamicro.com
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Message-ID: <fazd2fcfuwldtrarm6aw26qa5g6fcieoa35xz3bwchif6qfutw@xuvspa4e533b>
References: <DG4PS6NRRUC1.1FL8WBJVEEM4D@oss.qualcomm.com>
 <20260203142422.99110-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203142422.99110-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE3MCBTYWx0ZWRfX0484O/9CBgXy
 6djtZNWhIopxq6VegvX56PhQVeGCy78arWqjcQK4i6qPz2RfwPyVWu96o/Il2Pw7x02mtPDaLyW
 M3UgJmN+uUKsg687v13GwhBf1AcFCNU/h+PEcXRWB2vYA+SD2zg1IeQbi3nFwljLQ6Lsu5OO9D0
 WNPV6DIFrtaOm2VtqGgjzEtMuA92JfwQvSlnj2227k18UyDn9VaN2RxI1/UOLMWZJFkyfFpi8s/
 h8a1qn08bDYOHLoFdleRDaUB6w6Ve2wqRm89r8y8BOlcojq3y3keePf0j9ApVPabGPK/TLksyRb
 AMCIPHPXWtnzdDtSxFuiWDB6wxhWOafY/HCi+OKZZ7XsdBBOE+HuNlcGkKsH8Yo+Ft46VXsH/OC
 LUIdDJu0OJ3nOw+8MxbBjV7XGiOIORRytNIU7U+lmx+PUmy90ncO89Z2Cvu0sKu2L4TJpPDU9eO
 o6UsKfouGfVxaZ5qklg==
X-Proofpoint-ORIG-GUID: eW04o8AvHMHW--_XtljII1GISvta2dnY
X-Proofpoint-GUID: eW04o8AvHMHW--_XtljII1GISvta2dnY
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69826832 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=Y6f1DytA9gW5mLcrTH8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_132717_068628_F2449C63 
X-CRM114-Status: GOOD (  25.94  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMDMsIDIwMjYgYXQgMTA6MjQ6MjJQTSArMDgwMCwgZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tIHdyb3RlOgo+ID4+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tPgo+ID4+Cj4gPj4gRXh0ZW5kIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRl
Y3QoKSB0byBwcm9iZSBhbGwgSEdBVFAuTU9ERSB2YWx1ZXMKPiA+PiBzdXBwb3J0ZWQgYnkgdGhl
IGhvc3QgYW5kIHJlY29yZCB0aGVtIGluIGEgYml0bWFzay4gS2VlcCB0cmFja2luZyB0aGUKPiA+
PiBtYXhpbXVtIHN1cHBvcnRlZCBHLXN0YWdlIHBhZ2UgdGFibGUgbGV2ZWwgZm9yIGV4aXN0aW5n
IGludGVybmFsIHVzZXJzLgo+ID4+Cj4gPj4gQWxzbyBwcm92aWRlIGxpZ2h0d2VpZ2h0IGhlbHBl
cnMgdG8gcmV0cmlldmUgdGhlIHN1cHBvcnRlZC1tb2RlIGJpdG1hc2sKPiA+PiBhbmQgdmFsaWRh
dGUgYSByZXF1ZXN0ZWQgSEdBVFAuTU9ERSBhZ2FpbnN0IGl0Lgo+ID4+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gPj4gLS0tCj4g
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiA+PiBAQCAtNzUsNCArNzYsNDAgQEAg
dm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2Us
IGdwYV90IHN0YXJ0LCBncGFfdCBlbmQKPiA+PiArZW51bSBrdm1fcmlzY3ZfaGdhdHBfbW9kZV9i
aXQgewo+ID4+ICsJSEdBVFBfTU9ERV9TVjM5WDRfQklUID0gMCwKPiA+PiArCUhHQVRQX01PREVf
U1Y0OFg0X0JJVCA9IDEsCj4gPj4gKwlIR0FUUF9NT0RFX1NWNTdYNF9CSVQgPSAyLAo+ID4KPiA+
SSB0aGluayBpdCdzIGEgYml0IGF3a3dhcmQgdG8gcGFzcyA5IHdoZW4gc2VsZWN0aW5nIHRoZSBo
Z2F0cCBtb2RlLCBidXQKPiA+dGhlbiBsb29rIGZvciBiaXQgMCB3aGVuIGRldGVjdGluZyBpdC4u
Lgo+ID5XaHkgbm90IHRvIHVzZSB0aGUgUlZJIGRlZmluZWQgdmFsdWVzIGZvciB0aGlzIFVBQkkg
YXMgd2VsbD8KPiA+Cj4gPlRoZXJlIGFyZSBvbmx5IDE2IHBvc3NpYmxlIGhnYXRwLm1vZGUgdmFs
dWVzLCBzbyB3ZSdyZSBmaW5lIHN0b3JpbmcgdGhlbQo+ID5pbiBhIGJpdG1hcCBldmVuIG9uIFJW
MzIuCj4gCj4gSSB0aGluayB0aGlzIGlzIGEgZ29vZCBwb2ludC4KPiAKPiBVc2luZyBsb2dpY2Fs
IGJpdHMgMC8xLzIgaXMgaW5kZWVkIGxlc3MgaW50dWl0aXZlIHRoYW4gdGVzdGluZwo+IEJJVChI
R0FUUF9NT0RFX1NWMzlYNCkgd2hlbiB1c2Vyc3BhY2UgcGFzc2VzIHRoZSBhcmNoaXRlY3R1cmFs
IEhHQVRQLk1PREUKPiBlbmNvZGluZy4KPiAKPiBIb3dldmVyLCBpZiB3ZSB1c2Ug4oCcSEdBVFAu
TU9ERSBlbmNvZGluZyBhcyBiaXQgaW5kZXjigJ0sIHdlIG5lZWQgdG8gZXhwb3J0Cj4gdGhvc2Ug
ZW5jb2RpbmdzIHRvIHVzZXJzcGFjZS4gVG9kYXkgSEdBVFBfTU9ERV8qIGFyZSBub3QgcGFydCBv
ZiB0aGUKPiBVQVBJLCBzbyB1c2Vyc3BhY2Ugd291bGQgbmVlZCB0byBoYXJkY29kZSBtYWdpYyBu
dW1iZXJzLgo+IAo+IFNvIGlmIHdlIGdvIHdpdGggdGhpcyBhcHByb2FjaCwgSeKAmWxsIGFkZCBV
QVBJIGRlZmluaXRpb25zIGZvciB0aGUgSEdBVFAKPiBtb2RlIGVuY29kaW5ncyAoZS5nLiAjZGVm
aW5lIEtWTV9SSVNDVl9IR0FUUF9NT0RFX1NWMzlYNF9CSVQgIDgsIGV0Yy4pIGFuZAo+IHRoZW4g
ZGVmaW5lIHRoZSByZXR1cm5lZCBiaXRtYXNrIGFzIEJJVChtb2RlKS4KClRoZSBiZXN0IHBhcnQg
b2YgUmFkaW0ncyBzdWdnZXN0aW9uIGlzIHRoYXQgdGhlcmUgaXMgbm8gbmVlZCB0byBhZGQgdGhl
CmJpdHMgdG8gVUFQSS4gV2UgY2FuIHdyaXRlIGluIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUg
Y2FwYWJpbGl0eSB0aGF0CnRoZSBtb2RlIHZhbHVlcyBtYXRjaCB0aGUgc3BlYy4ga3ZtIHVzZXJz
cGFjZSBjYW4gdGhlbiBqdXN0IGxvb2sgYXQgdGhlCnNwZWMgdG8gZGV0ZXJtaW5lIHRob3NlIHZh
bHVlcyBhbmQgY3JlYXRlIGl0cyBvd24gZGVmaW5lcyAod2hpY2ggUUVNVSwKZm9yIGV4YW1wbGUs
IGhhcyBjZXJ0YWlubHkgYWxyZWFkeSBkb25lKS4KClRoYW5rcywKZHJldwoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
