Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B1DFEFB4D
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe/oM5S7OxoApkGkR1nwLbSii0tLwpQn3ZtTXx+ALDk=; b=YvIG3ECicV3hi8
	doJ3RXKmbl4O2tb1ak0jhgJ9hc8V+EUQRxKyFNVMg4Na5yIZK0AhBsBuq1r/DidvtiR40m9RSCdrg
	kRWF4kWSSN1C6rmjsRUwYYs7vIFFHJ6EbEvij/K4wbdgDhNQV7xK0UIOk021RC2IHKqCZ9SFQ9+dX
	24wcrabL3gANj31gIBvD6aUiiPGDhvJ6oCc1Ww3YPvRwk3nQdODnXUAMbNkeJzAiIp4aEh/XiQ59H
	VfQkebmEEQ11oMNuCwmfrpjyRpVOlMlTpDrIUs4AVEdcZxqeVAHcRioN0rSAs5wuTFh1uyqkXMGZR
	eQV0fbAOwF59WXmy19xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxtr-00000008NCJ-1IVC;
	Fri, 27 Feb 2026 13:28:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvxto-00000008NB5-0z0N
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 13:28:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RALsSl031225
	for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 13:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	az4A8WsRSQIRPaSotZ08AsqnlM/RQPqIKqEzlZWYba0=; b=gMN6reQxhwE+cY0e
	1i2jQY3avQAz/Eux6j5Ou9pjJcaJXBKsZqkB0v8UtRpcUeBt8kxc50SxK5cdGN0x
	vy7H6+ikVAJ8qVKPtDk4sgoqIDFWzgejc2kNn7HD/kLTvtxe5EakL69qayNZu2pl
	oOT2Iw2vhAgSRVz+rO7563JOMa6CxXMFUMnjyTggW8Dnnrc7VykQA7qRtOBSJ4y3
	mcqmLzmUGQROrvZfJESD9hHWlx/4MqjZBNEh0dAqb7XxP2XCu6ielY6lp54RjoFr
	gB9Jo/QSP+58/TXO2YBQ/1rz7FiuZ9E3yoE1jxMk8xnuoh9D+6KkSkMI7sJABIf3
	Szv4ng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f00h4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 13:28:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb390a0c4eso2194504085a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772198934; x=1772803734; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=az4A8WsRSQIRPaSotZ08AsqnlM/RQPqIKqEzlZWYba0=;
        b=IvVngO/y6OpKyMh5Ei7tH+JjYtgnzttxLW//IE+rivfZOSoYmIp5TsJhpyCb9cm673
         pLAA6PCVUcQWEDCndq4sHbKsY180rQ+NOizKiv7/xl1C2Aml9xVDDPPJT1HLYjey7sT4
         Nugqys4kKbP57g04tzDxYfU2W1X1OqIkiquza2ruuz15HgyqacZE+/tkaV2tsPhSmyT8
         AYHDPrw+NZ6FgSOYjExHR37h9d1SdWXD947nvBeGjgnYBqzRybFDkz2TGl/U47pCVihB
         rj+TxfEYa3/CdUFrl7LxUtcOaEAMd3gYHv+sW37j2G8s/xs4X18Who5yyDr1xsuBt+Tv
         45hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772198934; x=1772803734;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=az4A8WsRSQIRPaSotZ08AsqnlM/RQPqIKqEzlZWYba0=;
        b=wZan01o4gUl8OiQUzA4MAqVrG00LtZBCLVvvdK+hgvkMyBfJa0Py9kEL03MGRWasjE
         jnKzOqkmd0Q8DdcolGucYL9R/vr99TKzQZjFJ1JxWaAIsDnXHWn3J4pyaSOsm9WwMpqf
         MTjjmoIdBbtVFId9chtpS5gK87kZaC3Hg3eGeMr0jbi/v3KMZueA4fNfxQDM6V0aB01p
         qni/Zk8ehf91Uo6nvGp8gKQ7vjjvAZpcITRlec/34l95ebHpCm+0jm/Lg/MZ1q5det4K
         +YCR7PE3SyK1n3M9CoEwhSdJm0kHt3mATBdl+zyKUGb4PvnfDSb6I6O7UJgA8+2r2Ckp
         //mA==
X-Forwarded-Encrypted: i=1; AJvYcCV5jVRhyX38t/Zk0xUNvT/RWfZ/s7oAv1+nlLXsP3SunpsBOG9ncCs2xwATy0IlsWmExl9K147wFno=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3VjmhwDnn5I1xMvfr35AMy95jRJf/3ooDO/+8kh67zbtjyMxP
	8giFCphGRFHx3FjTcR8CF41IyXzmYY+U6Jh/w+0qqMtTaYUdAxcE/vnfe5Jz5eQCOWpEbw3FpHC
	heKOdZ1CMOo+Ff0gIaIPYl9pLmdCRr6HFa06WVzJv9NAjIG39aEadF8WToqPAklZG/sF6
X-Gm-Gg: ATEYQzz8eT36d7LJ1or7mV1h3i4l+OOmNzRl6veGHHm6VFSWox0+OCm8i9WOYyAglIo
	Hr3+5J3D8TdcAGINOR6zxCoqXBKZ2IJx2bHiINI6xzywajZXFPbFCccvQzHzdVGc27V3ebuum6g
	KqsbNDYNdMf5gwLkbWWU+YV5cKrgSJOPt8a5GLpzhIuYnBhf1zwuesy2YqKPE0yd5ZJehniCz4K
	7cKC/qWJEqqeb1/IFtZFF+xL+71eMnUQ4wwUTtQjkvpWB4U5S9MDZBNx0nEr3nQ2XDarBjeSdck
	dv/k2Xcqg5az7F5gJkxWRQzEd0YZ2D1etEbAV1/bBXOwDUE+GgI34ov2nb6/HyvapFsh3bT/my+
	hx53Sfb+XAYA4EJRb9bAe/1d7uXxvjpQMl4p07Ut/9340JGoTJBpHGIELgL4E
X-Received: by 2002:a05:620a:7108:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cbc8df0b7fmr340490185a.49.1772198934188;
        Fri, 27 Feb 2026 05:28:54 -0800 (PST)
X-Received: by 2002:a05:620a:7108:b0:89f:8bb8:c103 with SMTP id af79cd13be357-8cbc8df0b7fmr340483885a.49.1772198933454;
        Fri, 27 Feb 2026 05:28:53 -0800 (PST)
Received: from localhost (ip-86-49-242-13.bb.vodafone.cz. [86.49.242.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae93357sm145840866b.48.2026.02.27.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 05:28:52 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 27 Feb 2026 13:28:51 +0000
Message-Id: <DGPS39X0VRTU.3ATPEH33LUF1G@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] KVM: riscv: Fix Spectre-v1 in PMU counter access
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Daniel
 Weber" <daniel.weber@cispa.de>,
        "Michael Schwarz"
 <michael.schwarz@cispa.de>,
        "Marton Bognar" <marton.bognar@kuleuven.be>,
        "Jo Van Bulck" <jo.vanbulck@kuleuven.be>
To: "Lukas Gerlach" <lukas.gerlach@cispa.de>,
        "Anup Patel"
 <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Paul
 Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert
 Ou" <aou@eecs.berkeley.edu>,
        "Alexandre Ghiti" <alex@ghiti.fr>,
        "Andrew
 Jones" <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
 <20260226-kvm-riscv-spectre-v1-v1-4-5f930ea16691@cispa.de>
In-Reply-To: <20260226-kvm-riscv-spectre-v1-v1-4-5f930ea16691@cispa.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDExOSBTYWx0ZWRfX7Pjv4SoqApRi
 5SxSpNvovEwuxZYVyzbyP4lzryKQipA+pxZD6qL3wgb44Cow7aansYHsHeplbvON4Nf1q1exFpq
 quQRQUj0mHhhRooltvkzFvTPqBYkhF7SLCjgPrnG9O3VLWXCNC5KuW1atnlHiv/U2peCJQ5uyxZ
 Rkpw0aTno6SxcnNfYpmkGt8dYDwaNL/wnadt1xm4MDF5gzi+lvDhvJGAvgO5KrVwW2dNQQB9Qwo
 jWkWU5UY06OylfadzLuvcZrkwLxzSg34LiZJTJcZlRsnSJWg/j9UN52FAD5Lygq/JA6/awOJiTx
 HmhKG7m1j9TUGCwU4IhOxAUM6hHF9FsoCO63Bfj3KM1NQnijVbrDs9tDuPiT+5fRosKlGKW85r1
 5UaZkkfydkTiCAzLt04eDcoAs7Nh/PsyfZ2Fl9TqO5koPH2EcKTpLlUwQ9x1S2dPHgqHJhbVCLn
 AYQFUjNeeWyMatppFiA==
X-Proofpoint-GUID: rSWotpwkpZUeFmNyrfhFA-SiIPyXHZjM
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a19c16 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=9tUHzIdeCh+UoOnba06Qjw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=l_Klt5aIuPl-FdbJcjgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: rSWotpwkpZUeFmNyrfhFA-SiIPyXHZjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_052856_545501_693AAD8E 
X-CRM114-Status: GOOD (  16.98  )
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

MjAyNi0wMi0yNlQxNToxOTowMSswMTowMCwgTHVrYXMgR2VybGFjaCA8bHVrYXMuZ2VybGFjaEBj
aXNwYS5kZT46Cj4gR3Vlc3QtY29udHJvbGxlZCBjb3VudGVyIGluZGljZXMgcmVjZWl2ZWQgdmlh
IFNCSSBlY2FsbHMgYXJlIHVzZWQgdG8KPiBpbmRleCBpbnRvIHRoZSBQTUMgYXJyYXkuIFNhbml0
aXplIHRoZW0gd2l0aCBhcnJheV9pbmRleF9ub3NwZWMoKQo+IHRvIHByZXZlbnQgc3BlY3VsYXRp
dmUgb3V0LW9mLWJvdW5kcyBhY2Nlc3MuCj4KPiBTaW1pbGFyIHRvIHg4NiBjb21taXQgMTNjNTE4
M2E0ZTY0ICgiS1ZNOiB4ODY6IFByb3RlY3QgTVNSLWJhc2VkCj4gaW5kZXggY29tcHV0YXRpb25z
IGluIHBtdS5oIGZyb20gU3BlY3RyZS12MS9MMVRGIGF0dGFja3MiKS4KPgo+IEZpeGVzOiA4ZjAx
NTNlY2QzYmYgKCJSSVNDLVY6IEtWTTogQWRkIHNrZWxldG9uIHN1cHBvcnQgZm9yIHBlcmYiKQo+
IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEdlcmxhY2ggPGx1a2FzLmdlcmxhY2hAY2lzcGEuZGU+Cj4g
LS0tCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTUyNSw2ICs1MjgsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVf
cG11X2N0cl9pbmZvKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjaWR4LAo+
ICAJCXJldHVybiAwOwo+ICAJfQo+ICAKPiArCWNpZHggPSBhcnJheV9pbmRleF9ub3NwZWMoY2lk
eCwgUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyk7CgpUaGlzIG9uZSBhbHNvIGNvdmVycyBhIG5vbi1z
cGVjdWxhdGlvbiBidWcsIHNpbmNlIHRoZSBwcmV2aW91cyBjb25kaXRpb24KdXNlZCBjaWR4ID4g
UklTQ1ZfS1ZNX01BWF9DT1VOVEVSLiA6KSAgSSdsbCBzZW5kIGEgcGF0Y2ggZm9yIHRoYXQuCgpJ
IG5vdGljZWQgYSBmZXcgb3RoZXIgcGxhY2VzIHdoZXJlIG1pcy1zcGVjdWxhdGlvbiBpcyBwb3Nz
aWJsZSwKc2VlIGJlbG93OyBjYW4geW91IGV4cGxhaW4gd2h5IHRoZXkgZG9uJ3QgbmVlZCBwcm90
ZWN0aW9uPwoKQW55d2F5LCB0aGUgc2VyaWVzIGxvb2tzIGdvb2QsCgpSZXZpZXdlZC1ieTogUmFk
aW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KClRoYW5rcy4KCgot
LS0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3BtdS5jCmluZGV4IDRkOGQ1ZTlhYTUzZC4uMDgzMDFiNjAzM2YwIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11
LmMKQEAgLTg3LDcgKzg3LDcgQEAgc3RhdGljIHZvaWQga3ZtX3BtdV9yZWxlYXNlX3BlcmZfZXZl
bnQoc3RydWN0IGt2bV9wbWMgKnBtYykKIAogc3RhdGljIHU2NCBrdm1fcG11X2dldF9wZXJmX2V2
ZW50X2h3X2NvbmZpZyh1MzIgc2JpX2V2ZW50X2NvZGUpCiB7Ci0JcmV0dXJuIGh3X2V2ZW50X3Bl
cmZfbWFwW3NiaV9ldmVudF9jb2RlXTsKKwlyZXR1cm4gaHdfZXZlbnRfcGVyZl9tYXBbYXJyYXlf
aW5kZXhfbm9zcGVjKHNiaV9ldmVudF9jb2RlLCBTQklfUE1VX0hXX0dFTkVSQUxfTUFYKV07CiB9
CiAKIHN0YXRpYyB1NjQga3ZtX3BtdV9nZXRfcGVyZl9ldmVudF9jYWNoZV9jb25maWcodTMyIHNi
aV9ldmVudF9jb2RlKQpAQCAtNTU5LDcgKzU1OSw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVf
Y3RyX3N0YXJ0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbG9uZyBjdHJfYmFzZSwK
IAl9CiAJLyogU3RhcnQgdGhlIGNvdW50ZXJzIHRoYXQgaGF2ZSBiZWVuIGNvbmZpZ3VyZWQgYW5k
IHJlcXVlc3RlZCBieSB0aGUgZ3Vlc3QgKi8KIAlmb3JfZWFjaF9zZXRfYml0KGksICZjdHJfbWFz
aywgUklTQ1ZfTUFYX0NPVU5URVJTKSB7Ci0JCXBtY19pbmRleCA9IGkgKyBjdHJfYmFzZTsKKwkJ
cG1jX2luZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGkgKyBjdHJfYmFzZSwgUklTQ1ZfS1ZNX01B
WF9DT1VOVEVSUyk7CiAJCWlmICghdGVzdF9iaXQocG1jX2luZGV4LCBrdnBtdS0+cG1jX2luX3Vz
ZSkpCiAJCQljb250aW51ZTsKIAkJLyogVGhlIGd1ZXN0IHN0YXJ0ZWQgdGhlIGNvdW50ZXIgYWdh
aW4uIFJlc2V0IHRoZSBvdmVyZmxvdyBzdGF0dXMgKi8KQEAgLTYzMCw3ICs2MzAsNyBAQCBpbnQg
a3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9zdG9wKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWdu
ZWQgbG9uZyBjdHJfYmFzZSwKIAogCS8qIFN0b3AgdGhlIGNvdW50ZXJzIHRoYXQgaGF2ZSBiZWVu
IGNvbmZpZ3VyZWQgYW5kIHJlcXVlc3RlZCBieSB0aGUgZ3Vlc3QgKi8KIAlmb3JfZWFjaF9zZXRf
Yml0KGksICZjdHJfbWFzaywgUklTQ1ZfTUFYX0NPVU5URVJTKSB7Ci0JCXBtY19pbmRleCA9IGkg
KyBjdHJfYmFzZTsKKwkJcG1jX2luZGV4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGkgKyBjdHJfYmFz
ZSwgUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyk7CiAJCWlmICghdGVzdF9iaXQocG1jX2luZGV4LCBr
dnBtdS0+cG1jX2luX3VzZSkpCiAJCQljb250aW51ZTsKIAkJcG1jID0gJmt2cG11LT5wbWNbcG1j
X2luZGV4XTsKQEAgLTc2MSw2ICs3NjEsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9j
ZmdfbWF0Y2goc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9iYQogCQl9
CiAJfQogCisJY3RyX2lkeCA9IGFycmF5X2luZGV4X25vc3BlYyhjdHJfaWR4LCBSSVNDVl9LVk1f
TUFYX0NPVU5URVJTKTsKIAlwbWMgPSAma3ZwbXUtPnBtY1tjdHJfaWR4XTsKIAlwbWMtPmlkeCA9
IGN0cl9pZHg7CiAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==
