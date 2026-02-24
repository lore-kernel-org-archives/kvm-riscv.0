Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92066F55433
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 23:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6ZGI5LRiMRYJbYpztHn7zvZ+597U6u42Wfa5pphUAw=; b=2LCNKm5XKONSlF
	2P4eFRzUw1mFNQdszpcvxIFsD6EMDMqrHZ0JLC43bMzicelvZl4FIx0dAtORcUguw87X06ZzbwbZi
	bSh8v3YQdepaydR3wZ+4aO3p8sofuNu9t7av0bkpHmumQqzpJtkvZw9pRyXcQLw1xUG1FCh3f6+Fi
	+3Iwehza8GXYyKZvE94eQzLLI4hKsO6BjHWfSaJpV+7isvJyo9zXj88mSr+2zNr/cV1b9DkCK5dYL
	rwP01rJ+Ea/sB4hbEJo3BHabdfqK7UNHUbRbJ7RLZIv6oHpvUoFm5PnguVrOhFhj+2a/ptTvpsul1
	Fml7CSCuo/GWpLdfqG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1tY-00000002wMi-0VUG;
	Tue, 24 Feb 2026 23:32:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1tV-00000002wLV-31ZT
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 23:32:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OHDY7I2220821
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/DpEFJrKldwSa5Z3tOF7Ec0ZDIeg9YnoetK5bu/Ne8=; b=pTG4xCT49FAr7UOg
	pF2qErdScpUIC2b3l4TbAwGkzKRagwPm7TjTGPhJNRRLPbUUadELpRoj8ufMwEjp
	vbip9XsUl3zqNBP5zNgCCU6xTUjcpbm0Htb621/drE1FBTqC2QVl40Z7oA0eD1w0
	JLsswRD7uEwYRPieivH93nVuuUxT745KxtonfBrMz5AojuORjKnCQ0rA8ZwiXWeS
	qXVhYHylUGWljuGgjYqfAzg5VLjwQCBe68DknbMwi88m950ydHVeA6y0isZNxl9i
	lWrdCI+dbqN1GAd/nmTJh1UqJVENjAVTFSitoju3OBABTxSALIWkWVmCKYNVcMf+
	wlGDDw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e3bjgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 23:32:45 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127337c8e52so998714c88.1
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 15:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771975965; x=1772580765; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/DpEFJrKldwSa5Z3tOF7Ec0ZDIeg9YnoetK5bu/Ne8=;
        b=KGod2fKfJzdxumdGoU8iSjhZ/iHVmcvFQHQpeqHxyKwmz30/Yb+Kb/agvY5FkOJByC
         fSN+8WuC9MpHtxATF2E/wUOFXLw6dQmC5k5bJsUcGneHbIoKvt4oLoPBALktRKDr3lpK
         8D3KcS7maL6Bb3oWI66aZuWYglfzQOmCcZI2cDq3WNi4xRpqYz9FJ/VNIv4M/QrYxvGP
         yAQc8pgJ56x/Gbt65ZFpDbOJJwDfYv2TC+taBAtt3SxSCS2a1YFUUEVucDrewXXLc2sF
         JyEH5ZKW/VgBQbA3O+iAG1W10/GIiETl544/bpW86UMNcvtV3uAXMmPTu27DCtlZ1YOt
         XYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771975965; x=1772580765;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/DpEFJrKldwSa5Z3tOF7Ec0ZDIeg9YnoetK5bu/Ne8=;
        b=TIH/c5kDVALJaMS4TMnF/MnARkshJDgP+/8CpKN1NOBJSKHDbcuS6UizkYKEMulUkF
         bU6Hf5HbXM1U+Y6neyl1Hymkqc+aG2MphOC00jVq7vkxhjzEiIP/ku71GyY2oHTmcQ1b
         oQ5MMT8SDJDlFOZfsm4B5tqBQV18zjk00KjsF53tsl6l1Z3o8PqlVm9mVo3DQ2HklCTA
         JzoNfy7KvNczSQhPC69oyqXdZEvKS+11YMakmVi6kV1elOeFESNbaTvYxGObXy1snbXB
         t21tInN9Jbqs+33zGSKGYAWoau9gh3qGfTr0SK6CrFMGMCMF5zCvSrwBDvMuexKcuqLe
         nPQA==
X-Forwarded-Encrypted: i=1; AJvYcCWjo7WXKecTaLgwsQGlLK/2Xgv+wGZPDYMrHrniTE/wr/4nzleKPRv7qzXGhO057noM93kndhg0XJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzB1Rk62wK4uxA/Qb6DWfNNBAZf9BIlIUiVkDmlnfYSVdfHL57K
	AXjyOE2A95pCZilrSFrGO/qGIiK/J70KUm2mv0O4lvILQJD7vNey+/9DS41svOHK5kJ4tpJ59MN
	1l9cyTVgI7mae/2jmZ3H2ahFWn6K4ctCfOGrSdo9qjKz76Bk1vKm2TV1e42omRaaUMwC0
X-Gm-Gg: ATEYQzw+/0Jdm/L2gAHOcZgLow/xciBFIUzKk3M6z5yYQqyiJndW4h8mO8YxG+wR5yY
	NBwOqAVhP+QWUwycekU7gI9ogf7WnDCbFdlK3PbpyomD5MAH/l8pNfhJyEMlLwmh+K8lj12l6rL
	OpP9M1WRr3nx04JNLeKGrQxEFmXIB36a9byx/FqppymbNYdP5u3pfkeYcVonc7IsXN1aOpauO/s
	wTkp+ZH7B2UOcrVHai9jsNe9tYrg72DQ9DuoJQkxVd2FX8qjRx7TDrJDtjJaIQz4hN49lAPN62U
	sT3HdBlW0N6kzICQa3ZR0WGsqYfoiOQOShGaCPUNZkO+09hxrMnhZ6G5w2vX2DDwE6jWqL1cUA7
	aOEda74r7em8pdCB6SLXmdOnRH5ji/U8=
X-Received: by 2002:a05:7022:f96:b0:11b:7970:ea3f with SMTP id a92af1059eb24-1276ad11866mr6760054c88.25.1771975964488;
        Tue, 24 Feb 2026 15:32:44 -0800 (PST)
X-Received: by 2002:a05:7022:f96:b0:11b:7970:ea3f with SMTP id a92af1059eb24-1276ad11866mr6760037c88.25.1771975963864;
        Tue, 24 Feb 2026 15:32:43 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm11749921c88.10.2026.02.24.15.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:32:41 -0800 (PST)
Date: Tue, 24 Feb 2026 17:32:40 -0600
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
Subject: Re: [RFC PATCH v1 07/11] riscv: Export have_user_pmlen* booleans
Message-ID: <rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
 <CAH1PCMa96hdU+aZ6W48GQDj=FEoO=4P3VOZrUNi-g6WYaopKUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMa96hdU+aZ6W48GQDj=FEoO=4P3VOZrUNi-g6WYaopKUg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=DfIaa/tW c=1 sm=1 tr=0 ts=699e351d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=q-mjPIJXDBu-ais8TUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: mksyfuhG6-PE9qMdtycwL_9_DOd1sHsq
X-Proofpoint-ORIG-GUID: mksyfuhG6-PE9qMdtycwL_9_DOd1sHsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDIwOCBTYWx0ZWRfX2eGRfWxDlFlf
 uE1NDvQ+Xw8nPOIF9kUQqGd4QCBsXoeH8dMPWNy123Zu4FVfrIaQgkrtF/A3rH1MW2tsdVoxmI4
 FxrSKErGPziECpcVpic6KvPoidWCSi+uXiHjL8QiES2WIrgFA/CS9tVaV7VcChuG+nTGqg75aZs
 NFEoPwN20YqLiEtMy4MbMyfL9f+1x8jDPM0gfe5ohaJxzjzB/tJaa4yNGM2PzSLCb7AUUb+8LRr
 v7T3zSRHfB4fCr0RTGIqfFrPHq4xwCxpvyy5Qlgo/pHHuDbTaqphNxAj6SYtGDDLk5I08tBw5+T
 7RHF4jogd9P6Y7ICqMYjnihtbhPGNHlIv4Ev0LGcmluyoC5GpfaQfFu/ClRZ8AViM6IaA5rGYGv
 K3A+FEN2pIQaHbNq03mqdXA9t5/h8p1a8sxaiz6KNj5zwd/jPlCw0PBc/Jj8ZO3xBSWW6GAo1tx
 bljrCXL5SDzv17cAzyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_153245_766562_F7CB8686 
X-CRM114-Status: GOOD (  30.10  )
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

T24gU2F0LCBGZWIgMjEsIDIwMjYgYXQgMDY6NTA6NDNQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBGcmksIEZlYiA2LCAyMDI2IGF0IDg6MjTigK9BTSBBbmRyZXcgSm9uZXMKPiA8YW5k
cmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4KPiA+IEEgZm9sbG93aW5nIHBh
dGNoIHdpbGwgbmVlZCB0byBhY2Nlc3MgaGF2ZV91c2VyX3BtbGVuXzcgZnJvbQo+ID4gYW5vdGhl
ciBmaWxlLgo+IAo+IFRoZSB2YXJpYWJsZXMgYXJlIG1hZGUgbm9uLXN0YXRpYyBoZXJlIGJ1dCB3
aXRob3V0IGFuIGV4dGVybgo+IGRlY2xhcmF0aW9uIGluIGEgaGVhZGVyLgo+IAo+IEhvdyBhYm91
dCBhZGRpbmcgdGhlIGRlY2xhcmF0aW9ucyB0byBhc20vcHJvY2Vzc29yLmgsIGluc2lkZSB0aGUK
PiBwcm90ZWN0aW9uIG9mIHRoZSBDT05GSUdfUklTQ1ZfSVNBX1NVUE0gYmxvY2s/CgpZZXMsIEkg
Z3Vlc3MgYXNtL3Byb2Nlc3Nvci5oIGlzIGEgcmFuZG9tIGVub3VnaCBjb2xsZWN0aW9uIG9mIHN0
dWZmIHRoYXQKaGF2ZV91c2VyX3BtbGVuXzcgZml0cyBpbiB0aGVyZSBhcyB3ZWxsIGFzIGFueXdo
ZXJlIGVsc2UuIE1heWJlIEknbGwgYWRkCmEgZ2V0dGVyIGZ1bmN0aW9uIGluc3RlYWQsIHRob3Vn
aAoKIGJvb2wgcmlzY3ZfaGF2ZV91c2VyX3BtbGVuKHUzMiBsZW4pCgpUaGFua3MsCmRyZXcKCj4g
Cj4gc3lzX2h3cHJvYmUuYyBhbHJlYWR5IGluY2x1ZGVzIGFzbS9wcm9jZXNzb3IuaCwgc28gbm8g
bmV3IGluY2x1ZGVzCj4gd291bGQgYmUgbmVlZGVkLgo+IAo+IFBTOiBJIHNwb3R0ZWQgb25lIG1v
cmUgb2YgeW91ciBwYXRjaCBbMTAvMTFdIHJlZmVycyB0byBpdCwgd2hpY2ggYWRkcwo+IGFub3Ro
ZXIgYmFyZSBleHRlcm4gaW4gY3B1ZmVhdHVyZS5jLgo+IAo+IEJSLAo+IEd1b2RvbmcKPiAKPiAK
PiAKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3Mu
cXVhbGNvbW0uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwg
MTIgKysrKysrLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vz
cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCAzMWEzOTI5OTNjYjQu
LjRmYTE0YWZmN2Y4ZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
Ywo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBAQCAtMjc0LDggKzI3
NCw4IEBAIGVudW0gewo+ID4gICAgICAgICBQTUxFTl8xNiA9IDE2LAo+ID4gIH07Cj4gPgo+ID4g
LXN0YXRpYyBib29sIGhhdmVfdXNlcl9wbWxlbl83Owo+ID4gLXN0YXRpYyBib29sIGhhdmVfdXNl
cl9wbWxlbl8xNjsKPiA+ICtib29sIHJpc2N2X2hhdmVfdXNlcl9wbWxlbl83Owo+ID4gK2Jvb2wg
cmlzY3ZfaGF2ZV91c2VyX3BtbGVuXzE2Owo+ID4KPiA+ICAvKgo+ID4gICAqIENvbnRyb2wgdGhl
IHJlbGF4ZWQgQUJJIGFsbG93aW5nIHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBpbnRvIHRoZSBrZXJu
ZWwuCj4gPiBAQCAtMzA2LDEwICszMDYsMTAgQEAgbG9uZyBzZXRfdGFnZ2VkX2FkZHJfY3RybChz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4gICAgICAgICBw
bWxlbiA9IEZJRUxEX0dFVChQUl9QTUxFTl9NQVNLLCBhcmcpOwo+ID4gICAgICAgICBpZiAocG1s
ZW4gPT0gUE1MRU5fMCkgewo+ID4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19QTU1fUE1M
RU5fMDsKPiA+IC0gICAgICAgfSBlbHNlIGlmIChwbWxlbiA8PSBQTUxFTl83ICYmIGhhdmVfdXNl
cl9wbWxlbl83KSB7Cj4gPiArICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fNyAmJiBy
aXNjdl9oYXZlX3VzZXJfcG1sZW5fNykgewo+ID4gICAgICAgICAgICAgICAgIHBtbGVuID0gUE1M
RU5fNzsKPiA+ICAgICAgICAgICAgICAgICBwbW0gPSBFTlZDRkdfUE1NX1BNTEVOXzc7Cj4gPiAt
ICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fMTYgJiYgaGF2ZV91c2VyX3BtbGVuXzE2
KSB7Cj4gPiArICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fMTYgJiYgcmlzY3ZfaGF2
ZV91c2VyX3BtbGVuXzE2KSB7Cj4gPiAgICAgICAgICAgICAgICAgcG1sZW4gPSBQTUxFTl8xNjsK
PiA+ICAgICAgICAgICAgICAgICBwbW0gPSBFTlZDRkdfUE1NX1BNTEVOXzE2Owo+ID4gICAgICAg
ICB9IGVsc2Ugewo+ID4gQEAgLTQwNyw4ICs0MDcsOCBAQCBzdGF0aWMgaW50IF9faW5pdCB0YWdn
ZWRfYWRkcl9pbml0KHZvaWQpCj4gPiAgICAgICAgICAqIEFzc3VtZSB0aGUgc3VwcG9ydGVkIFBN
TEVOIHZhbHVlcyBhcmUgdGhlIHNhbWUgb24gYWxsIGhhcnRzLgo+ID4gICAgICAgICAgKi8KPiA+
ICAgICAgICAgY3NyX2NsZWFyKENTUl9FTlZDRkcsIEVOVkNGR19QTU0pOwo+ID4gLSAgICAgICBo
YXZlX3VzZXJfcG1sZW5fNyA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fNyk7Cj4g
PiAtICAgICAgIGhhdmVfdXNlcl9wbWxlbl8xNiA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1f
UE1MRU5fMTYpOwo+ID4gKyAgICAgICByaXNjdl9oYXZlX3VzZXJfcG1sZW5fNyA9IHRyeV90b19z
ZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fNyk7Cj4gPiArICAgICAgIHJpc2N2X2hhdmVfdXNlcl9w
bWxlbl8xNiA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fMTYpOwo+ID4KPiA+ICAg
ICAgICAgaWYgKCFyZWdpc3Rlcl9zeXNjdGwoImFiaSIsIHRhZ2dlZF9hZGRyX3N5c2N0bF90YWJs
ZSkpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiAtLQo+ID4gMi40My4w
Cj4gPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
