Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F6FFCC04D
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kjoWz0XAGq1XosoGCRcKJcXW5NG18RDHegEZ1J9yjg=; b=clJzApUFyjlE/y
	Lynx30mgThMSoZQkiJxAI09re5ZljPZly3YzTWqyPjKM9YOFg0fKQ900hA3MrrMEhCVfuqA+L0Q2j
	1yuoemNdtZ2XGy6ihrrukWQpFFLGJynsjMGA/lZC29gv4ToK1MlPjX/TDJCT1NQxdz3uFnnqd2yI1
	rpoErXMNkfAz6p+jqGkNi59J0/pBILtkhTOXnNs3yuy/jBTorD0MZaxlmAQnwpwIbo2HXzcxTLCLf
	HGhZ3k/twivsNcPtiBWn+y2dbr6VlMV9yLCgsd8ypRrCyvGfcOkCNYIW0GaHYXo5FC1vlNj8JmqO3
	rJAltkcqbx8FDpaPd7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZxB-00000004KeG-1xBZ;
	Fri, 06 Mar 2026 18:31:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZx8-00000004KdB-2pTx
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:31:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H2PcH742668
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1w2q3dGyBH3LEgtLlC9UbiU4jU2OMDUKUkNWGCIpHlM=; b=L0vo0dy3JUOLWhny
	vrHAC8TCo+JvReI4EB4bdCXyjVFooxjjktWFuuNmf4erd42sA38EnBDjTFAFrWzg
	4663Ltfbp/ikV/W+EqKTGOEx7R/dAUXpzwmjELaIAok8XmybHfp8XLz10QUBL08O
	2VMSaEAWlR/JG/ZfGGZbOPwCDIqD8lxEHvZSkn+yR+09IjSBbrNFcuZh0bZAd3AA
	x+TarAl92gG2pi2vFXnVbtvMCLAAA7/HNoZXTI/6FjC7KKN3bEidKzVzyQjdwpYi
	GihMdghWVP9gxxYySVhZCYnpArsvy5AWXitbE7Fm/LdjlzuM6QUaQ1yuzy0N7HUG
	AxUjzQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdtxsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:31:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-128babbc373so13809745c88.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772821869; x=1773426669; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1w2q3dGyBH3LEgtLlC9UbiU4jU2OMDUKUkNWGCIpHlM=;
        b=hvNK/b14e/HNyewCgo2Ls7OHFNhXeFuzJSd78b6nF4vorm8Cb/5Y6q2Kq0atbhFUrC
         DpKaIeQoz9Thxo5QxJtGG7Nq7oYHOlyVotuREugiWPvo5flnPvdhrKc3wFMltzFb2/Qq
         tkXZ90H8yBLiWXDhPi23x7AFh97Bbgx7rCHAZgzJYZqU4ugSJMyyPFKQuHCRbh9z58+0
         mqZtjmqQRPY077prIMG9D7HsYWtp7Z05tZAunxQjxwRawGhIuxNeMu62Medmo/fZqoSs
         NY+EMeRhgoGr/Z7umHPGoKEZ5ggr5srryzfw7lWwKaRDBLihpJb4cZHq+SZtsX0kkGuO
         q77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772821869; x=1773426669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1w2q3dGyBH3LEgtLlC9UbiU4jU2OMDUKUkNWGCIpHlM=;
        b=vTAzQNVhn9takS9fFWYvqUYXgbTTDELkAzDYNEb2rq1CqIKneIMQ3sJX/3VP9Yhj9C
         RW9/pQuUBqVrWQEyFzDVbPNvM8+Qm9BAiCG4m0JwCT53823ZXtNijJkQgVzc1wehsHXc
         yPIIj3eOCbfvXU7l7Ye+TbO333wLn+Yv42bbAhl0D7bZe7d8tPfVOVRg9RvTVFT4CNow
         5tFAOD8OSlx5UqCY72aBCd6+MQ6x1ImN3xatMDWYXjTLxHZY/yPvjRmYCMnzZcC5anXf
         8PGCOpK6Ylzwksv9kOvx8C9EWgu1phYQCV834s29+kJXlA9WAgXrLMWs0WgBOHh5cfu5
         Ee7A==
X-Forwarded-Encrypted: i=1; AJvYcCUeOyhM2h+yIZx40IzyCKHZF7lwMcNMJsnNYvPluKfdDzabaeaFRQI68/GFsosXSsLYTkmiH2biVuU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJWwxJ1z/ydh7aaSKwJMAXGSpvxc7RQNDXzBJau2kum9/NGO3D
	zwIT3cxKjKN+2guVWpXzUuDjI8PUY5wp+RtK291SXjPE4mS9iFE5KtSH/cBtBD1I9ZtxFWqHlYD
	PeKcjGOEJooq3KfNFik+qNn8LL5IXTk5ybFc6tlE+Ln5Hlvnf189MEhQPjuPw9YzSQfQZ
X-Gm-Gg: ATEYQzzIGHXHNhrIEPAsYjx70kk61LaX9enyOyTZnqu3E2ne/TYUSQeWqf/BPupkLuN
	Zwwy6BknVRcqVNWleYL8xdkn3iAfVhY/7GjUT+UyGxwixf1s0cVMkQUYVd+pIslT2GxAQxfeKTS
	E9Osf+LTGkBLmrpIv4kG/66DVj9W33y0e1eIFH3QCB2FQKjpa/ljmE+thugTEyjfmp6IypLTx+T
	R+sYbAE/bwrMDxH+/qUxn8UKjI4+Ax1+49flwXB1SQl9CU+tZKieNTFrPIqtfZRXuV8BTxF9NeA
	gxSS/l7akoPHjIPXvXpVIhkhJEbsG+vNgvWNqGMf7KjqYaNpqkE3AMibRNIdtcN5mYbSo44XGkm
	mj4rG2IqfvNhvpvX/2t5cBd5NDXjZ0ys=
X-Received: by 2002:a05:7022:60a9:b0:11b:7824:5c97 with SMTP id a92af1059eb24-128c2ed96bdmr1480591c88.40.1772821869300;
        Fri, 06 Mar 2026 10:31:09 -0800 (PST)
X-Received: by 2002:a05:7022:60a9:b0:11b:7824:5c97 with SMTP id a92af1059eb24-128c2ed96bdmr1480574c88.40.1772821868628;
        Fri, 06 Mar 2026 10:31:08 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f43593sm1961171c88.9.2026.03.06.10.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:31:08 -0800 (PST)
Date: Fri, 6 Mar 2026 12:31:06 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 08/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Message-ID: <owzoxraajtnen4vaf3fbr7phcmbnshu3rs6vwoyoqe5t3grefm@k7vhogtkxryd>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-9-andrew.jones@oss.qualcomm.com>
 <CAH1PCMbjmUA7_o5eAbCgn3cbiW=Di5pEHkDSSiaOFz_02DnMoQ@mail.gmail.com>
 <vyblse6xxx5gtlxtd3rmks2sf52wtuntgisocl243nqfarpgvf@a7ltb5p5ide4>
 <CAH1PCMbOcpQSjfLBOYvtB1Od7p8kYZKgwH1VusToKzuU_Z2hqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMbOcpQSjfLBOYvtB1Od7p8kYZKgwH1VusToKzuU_Z2hqA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: b2doF0rgFTqhrAKsvfBynRr8sNgYbE9Z
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69ab1d6e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sIl3Dz2dppHXUnfx8bMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NSBTYWx0ZWRfX7mWpJbsUuJOZ
 +N9/4uCWnTdOjVgEaK4BGTiV7mTN170e6MuF989lclTIyWN+GHUuCUAJS6IRLa/2AQrTUu5fh6W
 8rpjKfiylVeo02E3mj/GK0lsFtPe3Q23zgtysgRA1ox4vGMy/9SKcWCT8v+Tg2VBL4bUmTnp4Al
 I5EblYhWggMzgs13ayAZMoozi/HsAg2J4d8HFpvE5e8z+G0o9rb/qKKQcKnvtIY8voc9Y2f+DGw
 EBR3cMCjUq4slRnYeSHvkoRfjjqpPen1NDH74JfZqshFGKhZ3P/rziHvCruWvZv/0tZNYzuD8pr
 m14GsnSIAibit2A7dLv6aeazjO04ZSXH+BD4VkzWW1bPMyrW4Lsv7GQ07aKE3vGIs87JtULT5K8
 fPOS1aiqzhjTlmRpogn3DY5W75EnsX9ArBIKv/y2ZQwUGd1wxPRH2OAz3ADR9r8OOkK0N3ETNQe
 6gXqycvI5ZcAhrPC65w==
X-Proofpoint-GUID: b2doF0rgFTqhrAKsvfBynRr8sNgYbE9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_103110_720928_1323605D 
X-CRM114-Status: GOOD (  45.71  )
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

T24gRnJpLCBNYXIgMDYsIDIwMjYgYXQgMDg6Mjk6MjRQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCA4OjAz4oCvQU0gQW5kcmV3IEpvbmVzCj4gPGFu
ZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTYXQsIEZlYiAy
MSwgMjAyNiBhdCAwNjo1MToyNVBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPiBIaSwg
RHJldwo+ID4gPgo+ID4gPiBPbiBGcmksIEZlYiA2LCAyMDI2IGF0IDg6MjTigK9BTSBBbmRyZXcg
Sm9uZXMKPiA+ID4gPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4g
Pgo+ID4gPiA+IFByb3ZpZGUgYSBiaXQgdG8gY29udmVuaWVudGx5IGRldGVybWluZSB3aGVuIFJW
QTIzVTY0IGlzIHN1cHBvcnRlZC4KPiA+ID4gPiBXaGlsZSBpdCdzIGFscmVhZHkgcG9zc2libGUg
dG8gZGV0ZXJtaW5lIFJWQTIzVTY0IHN1cHBvcnQgd2l0aCBmaXZlCj4gPiA+ID4gaHdwcm9iZSBj
YWxscyBhbmQgZm91ciBwcmN0bCBjYWxscyBpdCB3b3VsZCBiZSBlcnJvci1wcm9uZSB0byByZXF1
aXJlCj4gPiA+ID4gYW55dGhpbmcgKGFuZCB3ZSBwcmVzdW1lIGV2ZW50dWFsbHkgYWxtb3N0IGV2
ZXJ5dGhpbmcpIHRoYXQgbmVlZHMgdG8KPiA+ID4gPiBjaGVjayBmb3IgUlZBMjNVNjQgc3VwcG9y
dCB0byBhbGwgaW1wbGVtZW50IHRob3NlIGNhbGxzIGFuZCBzcGVjaWZpYwo+ID4gPiA+IGNoZWNr
cy4gQW5kLCB3aGlsZSBSVkEyM1U2NCBpcyB0aGUgSU1BIGJhc2Ugd2l0aCBtYW5kYXRlZCBleHRl
bnNpb25zLAo+ID4gPiA+IG1vc3Qgc29mdHdhcmUgd2lsbCBjb25zaWRlciBpdCBhIG5ldyBiYXNl
LiBGb3IgdGhlc2UgcmVhc29ucywgYWRkCj4gPiA+ID4gdGhlIFJWQTIzVTY0IGJpdCBhcyBhIGJh
c2UgYmVoYXZpb3IgYml0Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpv
bmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPgo+
ID4gPiA+ICsjZGVmaW5lIEhXUFJPQkVfRVhUMF9SVkEyM1U2NCAoICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgIC8qIElNQSBpcyBhbHdheXMg
c3VwcG9ydGVkICovICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgICAg
UklTQ1ZfSFdQUk9CRV9JTUFfRkQgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBc
Cj4gPiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0lNQV9DICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIC8qIEIgaXMgWmJhLCBaYmIgYW5kIFpi
cyAqLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgICAgUklTQ1Zf
SFdQUk9CRV9FWFRfWkJBICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4gPiA+
ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQkIgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pCUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gPiA+ICsgICAgICAgLyogWklDU1IgaXMg
YWx3YXlzIHN1cHBvcnRlZCAqLyAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyAg
ICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUNOVFIgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
ICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJSFBNICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gPiA+ICsgICAgICAgLyogWklDQ0lGIGlzIGluIEVY
VDEgKi8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgICAv
KiBaSUNDUlNFIGlzIGluIEVYVDEgKi8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gPiArICAgICAgIC8qIFpJQ0NBTU9BIGlzIGluIEVYVDEgKi8gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gPiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQ0xT
TSAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4gPiA+ID4gKyAgICAgICAvKiBaQTY0
UlMgaXMgaW4gRVhUMSAqLyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4g
PiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJSElOVFBBVVNFICAgICAgICAgICAgICAgICAg
IHwgICAgICAgXAo+ID4gPiA+ICsgICAgICAgLyogWklDNjRCIChjaGVjayBibG9jayBzaXplcyBh
cmUgNjRiKSAqLyAgICAgICAgICAgICAgICBcCj4gPiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JF
X0VYVF9aSUNCT00gICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAg
ICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJQ0JPUCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAg
ICAgXAo+ID4gPiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAgICBcCj4gPiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9a
RkhNSU4gICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJ
U0NWX0hXUFJPQkVfRVhUX1pLVCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+
ID4gPiA+ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9JTUFfViAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICAgICBcCj4gPiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aVkZITUlO
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hX
UFJPQkVfRVhUX1pWQkIgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gPiA+
ICsgICAgICAgUklTQ1ZfSFdQUk9CRV9FWFRfWlZLVCAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgICAgICBcCj4gPiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlROVEwgICAg
ICAgICAgICAgICAgICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVf
RVhUX1pJQ09ORCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gPiA+ICsgICAg
ICAgUklTQ1ZfSFdQUk9CRV9FWFRfWklNT1AgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAg
ICBcCj4gPiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQ01PUCAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pD
QiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gPiA+ICsgICAgICAgUklT
Q1ZfSFdQUk9CRV9FWFRfWkZBICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4g
PiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQVdSUyAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1NVUE0gLyog
KGNoZWNrIFBNTEVOPTcgc3VwcG9ydCkgKi8gICAgXAo+ID4gPiA+ICspCj4gPiA+ID4gKwo+ID4g
PiA+ICsjZGVmaW5lIEhXUFJPQkVfRVhUMV9SVkEyM1U2NCAoICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pJ
Q0NJRiAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgXAo+ID4gPiA+ICsgICAgICAgUklT
Q1ZfSFdQUk9CRV9FWFRfWklDQ1JTRSAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICBcCj4g
PiA+ID4gKyAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aSUNDQU1PQSAgICAgICAgICAgICAgICAg
ICAgICB8ICAgICAgIFwKPiA+ID4gPiArICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pBNjRSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICspCj4gPiA+ID4gKwo+ID4g
PiA+ICtzdGF0aWMgYm9vbCBod3Byb2JlX2hhc19ydmEyM3U2NChjb25zdCBzdHJ1Y3QgY3B1bWFz
ayAqY3B1cykKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgICAgc3RydWN0IHJpc2N2X2h3cHJvYmUg
cGFpcjsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHXzY0
QklUKSkKPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+ICsKPiA+
ID4gPiArICAgICAgIC8qIEFkZGl0aW9uYWwgbWFuZGF0ZXMgZm9yIFppYzY0YiBhbmQgU3VwbSAq
Lwo+ID4gPiA+ICsgICAgICAgaWYgKHJpc2N2X2Nib21fYmxvY2tfc2l6ZSAhPSA2NCB8fAo+ID4g
PiA+ICsgICAgICAgICAgIHJpc2N2X2Nib3BfYmxvY2tfc2l6ZSAhPSA2NCB8fAo+ID4gPiA+ICsg
ICAgICAgICAgIHJpc2N2X2Nib3pfYmxvY2tfc2l6ZSAhPSA2NCB8fAo+ID4gPiA+ICsgICAgICAg
ICAgICFyaXNjdl9oYXZlX3VzZXJfcG1sZW5fNykKPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0
dXJuIGZhbHNlOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGh3cHJvYmVfaXNhX2V4dDAoJnBh
aXIsIGNwdXMpOwo+ID4gPiA+ICsgICAgICAgaWYgKChwYWlyLnZhbHVlICYgSFdQUk9CRV9FWFQw
X1JWQTIzVTY0KSAhPSBIV1BST0JFX0VYVDBfUlZBMjNVNjQpCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBod3Byb2JlX2lzYV9l
eHQxKCZwYWlyLCBjcHVzKTsKPiA+ID4gPiArICAgICAgIGlmICgocGFpci52YWx1ZSAmIEhXUFJP
QkVfRVhUMV9SVkEyM1U2NCkgIT0gSFdQUk9CRV9FWFQxX1JWQTIzVTY0KQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgcmV0dXJu
IHRydWU7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gICNpZiBkZWZpbmVkKENPTkZJR19S
SVNDVl9QUk9CRV9VTkFMSUdORURfQUNDRVNTKQo+ID4gPiA+ICBzdGF0aWMgdTY0IGh3cHJvYmVf
bWlzYWxpZ25lZChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cykKPiA+ID4gPiAgewo+ID4gPiA+
IEBAIC0zMTIsNiArMzgyLDggQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3Qg
cmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ID4gPiAgICAgICAgICAqLwo+ID4gPiA+ICAgICAgICAg
Y2FzZSBSSVNDVl9IV1BST0JFX0tFWV9CQVNFX0JFSEFWSU9SOgo+ID4gPiA+ICAgICAgICAgICAg
ICAgICBwYWlyLT52YWx1ZSA9IFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9JTUE7Cj4gPiA+
ID4gKyAgICAgICAgICAgICAgIGlmIChod3Byb2JlX2hhc19ydmEyM3U2NChjcHVzKSkKPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0JB
U0VfQkVIQVZJT1JfUlZBMjNVNjQ7Cj4gPiA+Cj4gPiA+IFRoZXJlIGFyZSB0d28gc2VwYXJhdGUg
aW1wbGVtZW50YXRpb25zIG9mIFJWQTIzVTY0IGRldGVjdGlvbiBpbgo+ID4gPiB5b3VyIHBhdGNo
c2V0Ogo+ID4gPiAxLiBJbiB0aGlzIHBhdGNoOiBod3Byb2JlX2hhc19ydmEyM3U2NCgpLCB3aGlj
aCBjaGVja3MgYWdhaW5zdAo+ID4gPiBSSVNDVl9IV1BST0JFX0VYVF8qIGJpdHMuCj4gPiA+IDIu
IEluIFtQYXRjaCAxMC8xMV06IHJpc2N2X3NldF9pc2FfYmFzZXMoKSwgd2hpY2ggY2hlY2tzIGFn
YWluc3QKPiA+ID4gUklTQ1ZfSVNBX0VYVF8qLgo+ID4gPgo+ID4gPiBJJ20gbm90IHN1cmUgSSBm
dWxseSB1bmRlcnN0YW5kIHlvdXIgcmVhc29uaW5nIGJlaGluZCB0aGlzCj4gPiA+IGR1cGxpY2F0
aW9uIChpdCdzIHRvbyBvYnZpb3VzIGZvciBtZSBub3QgdG8gZG91YnQgbXlzZWxmKS4KPiA+Cj4g
PiBXZSBwdXJwb3NlbHkgdXNlIGh3cHJvYmUgYml0cyBpbiBod3Byb2JlIHNpbmNlIHdlIHdhbnQg
dG8gZW5zdXJlCj4gPiBjb25zaXN0ZW5jeS4gV2UgdXNlIHRoZSBpc2EgYml0cyBldmVyeXdoZXJl
IGVsc2UgYXMgdGhhdCdzIHRoZQo+ID4gdHlwaWNhbCBwbGFjZSB0byBjaGVjay4KPiA+Cj4gPiA+
IEF0Cj4gPiA+IGxlYXN0IGZvciBub3csIEkgdGhpbmsgdGhlIGh3cHJvYmUgdmVyc2lvbiBpcyBu
b3QgZ29vZCBmcm9tIGFuCj4gPiA+IGFyY2hpdGVjdHVyZSB2aWV3cG9pbnQuCj4gPiA+Cj4gPiA+
IE15IGxvZ2ljIGlzIHRoaXM6IFJWQTIzVTY0IGlzIGEgaGFyZHdhcmUgaW1wbGVtZW50YXRpb24g
ZmVhdHVyZS4KPiA+ID4gSXQgZXhpc3RzIG5vIG1hdHRlciB3aGV0aGVyIHlvdSBleHBvcnQgaXRz
IHN1Yi1jb21wb25lbnRzICh0aG9zZQo+ID4gPiBtYW5kYXRvcnkgZXh0ZW5zaW9ucyByZXF1aXJl
ZCBieSBSVkEyMyBQcm9maWxlKSB0aHJvdWdoIGh3cHJvYmUgb3IKPiA+ID4gbm90LiBQcm9maWxl
IGNvbmZvcm1hbmNlIHZzLiBwZXItZXh0ZW5zaW9uIGV4cG9ydCBzaG91bGQgc3RheQo+ID4gPiBp
bmRlcGVuZGVudC4KPiA+ID4KPiA+ID4gRFQvQUNQSSAtPiBSSVNDVl9JU0FfRVhUXyo6IHRoZXNl
IGFyZSBncm91bmQgdHJ1dGguCj4gPiA+IFJJU0NWX0hXUFJPQkVfRVhUXyo6IHRoZXNlIGFyZSBh
IGZpbHRlcmVkIHN1YnNldC4KPiA+ID4KPiA+ID4gV2Ugc2hvdWxkbid0IGJlIHB1c2hlZCB0byBl
eHBvcnQgKGh3cHJvYmUpIGFuIGV4dGVuc2lvbiBqdXN0Cj4gPiA+IHRvIG1ha2UgdGhlIFJWQTIz
VTY0IGNhbGN1bGF0aW9uIGNvcnJlY3QuIFRoZSBjcml0ZXJpYSBmb3IKPiA+ID4gZXhwb3J0aW5n
IGFuIGV4dGVuc2lvbiB0aHJvdWdoIGh3cHJvYmUgc2hvdWxkIGJlIGJhc2VkIG9uCj4gPiA+IHdo
ZXRoZXIgdGhlcmUgaXMgYSB1c2Vyc3BhY2UgY29uc3VtZXIgd2hvIG5lZWRzIGl0Cj4gPiA+IGlu
ZGl2aWR1YWxseS4KPiA+Cj4gPiBJIGFncmVlIHdpdGggdGhlICJvbmx5IHB1Ymxpc2ggc3R1ZmYg
aW4gaHdwcm9iZSB0aGF0IHVzZXJzIGNhcmUgYWJvdXQiCj4gPiBhcHByb2FjaCBhbmQgd2UgZG8g
aGF2ZSBwcmVjZWRlbnQgZm9yIG5vdCBwdWJsaXNoaW5nIGV4dGVuc2lvbnMgY292ZXJlZAo+ID4g
YnkgdGhlIGJhc2UgYWxyZWFkeSAoSSwgTSwgYW5kIEEgYXJlIG5vdCBpbmRpdmlkdWFsbHkgaW4g
aHdwcm9iZSAtLQo+ID4gYWx0aG91Z2ggdGhleSBhcmUgaW4gaHdjYXApLgo+ID4KPiA+IEZvciB0
aGlzIHNlcmllcyBJIGNvdWxkIGRyb3AgYW55IGV4dGVuc2lvbnMgdGhhdCBwZW9wbGUgYXJlIHVu
bGlrZWx5IHRvCj4gCj4gSSBhbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgeW91IGNvcnJlY3RseS4g
SWYgYW55IG9mIHRoZSBIV1BST0JFX0VYVF8gaWQKPiBpcyBkcm9wcGVkLCB0aGF0IHdpbGwgbWFr
ZSB5b3VyIGNoZWNrIGluIGh3cHJvYmVfaGFzX3J2YTIzdTY0KCkgZmFpbC4KPiAKPiBBbmQgdGhh
dCB3aWxsIGNhdXNlIGEgbWlzbWF0Y2gsIHdoZXJlIC9wcm9jL2NwdWluZm8gKGllLgo+IHJpc2N2
X3NldF9pc2FfYmFzZXMoKSkgcmVwb3J0cyAncnZhMjN1NjQnLCBidXQgaHdwcm9iZSByZXBvcnRz
Cj4gbm8gJ3J2YTIzdTY0Jy4KPiAKPiBJcyB0aGF0IHdoYXQgeW91IGludGVuZCwgb3IgZG8geW91
IG1lYW4gc29tZXRoaW5nIGRpZmZlcmVudD8KClRoZSBpbXBsZW1lbnRhdGlvbiBvZiBod3Byb2Jl
X2hhc19ydmEyM3U2NCgpIHdvdWxkIGhhdmUgdG8gY2hhbmdlIGFuZCBhbGwKbXkgY29uc2lzdGVu
Y3kgc3R1ZmYsIGluY2x1ZGluZyB0aGUgc2VsZnRlc3QsIHdvdWxkIGJlIGRyb3BwZWQuCgpUaGFu
a3MsCmRyZXcKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
