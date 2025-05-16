Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBA1C3ABC9
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 May 2025 23:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2Kd5JtwD6Lue6jk0qE/QgI8gnnMS5RqNlOUSJS5eeE=; b=g+mkOQbqQM9iYQ
	ry5NHfnko7vAFdWQxJ3JbiJLf/BjiwJRYnhTLF8ovW3jPRD+WeLA+fvqnBOBChJcJcTmeG/4rEpGR
	gWe1jCzjcKG2RhcytBs6MvMm2fqz8t22LQH1lmCXPdtQl/KMsNx67Xyxr/xmVS4JkyGg711CHrciF
	pUPpG+9gte5J4dv/13PQweeTkOBguaELsPn/1S7NVOz7fkXRmAN7rOsFeo8fQKqvm1QNterdLASZt
	w5Cd0nyhKQ83ib71/fF8PlweW6I4g2nsyyKxYlKBsz0Bwh9TEFO+tUeOSstc8aGYW18MPLxcR28g5
	ii72ZZpJowH9fda4oRKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4s1-00000004str-2X6w;
	Fri, 16 May 2025 23:53:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4ry-00000004st0-0UOO
	for kvm-riscv@lists.infradead.org;
	Fri, 16 May 2025 23:53:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23205d55bf4so257745ad.2
        for <kvm-riscv@lists.infradead.org>; Fri, 16 May 2025 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747439617; x=1748044417; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+X0sEMByIYCJp9C2VC0Yrhh05RdaqRYJfaKNmUnn3Dg=;
        b=woueQsN1GwjUO1a7PdYdKqA9plvzUost2Kf/XOh+kfc45hEKSO8GtnlmEoGrpQghcB
         7Q6bCQNwrocvRT4QwcIqeFVPuAkLN/181jTLapw4MmB6/MBvnSd4fPhd05WidupofPWq
         GgnTAI2NeyyY1evdMBHf/U3hnEZWf+lxmIn0RJPTPYwoo/uW+bi93MM3EO6LDRoKMMDz
         TmF+fdXRjk9RPPNVmUNt+d7l7TJtJ38XCamiaLO3zlSJYO5kA4eSRVRDCTmQx+43wFuf
         V5D0I0mpRTVRYZosdb3KIcYseRsdiasw3EMW31Q6e7j0lq+7Mben2JfvZ/K62ND6lvUM
         YkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747439617; x=1748044417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+X0sEMByIYCJp9C2VC0Yrhh05RdaqRYJfaKNmUnn3Dg=;
        b=FvLYOKuwfTCvOjiYXfwxKK+IJPgfvl53Q25Ov6sPn1kBm/i3BTqxp3mScG3eauGVz8
         drqWnxMaiQUQl1bMPt3UEHFqdKt/aSV2m6E469bhT1HOvyS6zfD8b0Ip73UITvvjn9c8
         HHlai5WSF5e4AwFIMS2zfEi3J1SfGNX6xOEh9YGOMjG4ONT3V4GNeZS6At0VOkilor9a
         ScX1CzzCsEJWmSv0WOo+MrC8826qHVQDs89zFAHfdxEZbhX/8jJcLmwoyt5Ul/fZ/oWY
         fft9B5+PIBUHnYNNl77djWsaPNvxyrvaTbs0K5/99GcVe62ffAixH6g+zAM0+bY7KolX
         QxYw==
X-Forwarded-Encrypted: i=1; AJvYcCXIy0yPrnHP3p/Tda8ddLvtPa9ioYnecPhdoV4yaXebFKFycz+0g7cbY/b9CBxNo9E96ynAocexbzo=@lists.infradead.org
X-Gm-Message-State: AOJu0YywpghbLOJb5GqsCMayTDFK3d0wrD8uO7klMmMz7ttDMxtkqEmn
	cf5sW61mrwiRz6i4mF9CDdYFIKZ7D8yvesZXX8tP2ej0PvuDGY14PiFHEwu1zan9A8Y=
X-Gm-Gg: ASbGncuffpLyGhST8AAtvblqQzG8SlrNR4QtwmZNEjwo3qGsFPNAmrUscrskyGsAyfl
	kgvdNknT1pm9YnbASr2znqQEJW25F8RVFiSPFC8NwZ2ZKplkwxYUjNsPPd2rUd+KvX/x/XoXu0k
	MQEhSgr+x/ziNYnPJvfRlpi5KoXAVkNbzWuZDM97Pderz7uW/1RKPr9oOvTUWtUW9KCwp7j5eVj
	3N3v4s7PJ93TW6CmoIkaJz54EpR1aiWvpgZ0X23jjvgbHvMJ98ApGLdi1J348yW0RRA+kJlBoI/
	5nJeZI6DsgoE5Hu7H8uUsuDZoordYrP3AMZSuCgcwO9QnwHavhtM
X-Google-Smtp-Source: AGHT+IFRzWoflz3ycvTOCP0vPm7ds3Ft1eoTh6/GYuCA/U8J5Mo9M+nIUUI5eWrfofGnl4RnIgS3/Q==
X-Received: by 2002:a17:903:f8d:b0:21f:1549:a563 with SMTP id d9443c01a7336-231d43d56ccmr63299065ad.2.1747439616878;
        Fri, 16 May 2025 16:53:36 -0700 (PDT)
Received: from [192.168.1.23] ([50.34.76.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac95e1sm19998765ad.20.2025.05.16.16.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 16:53:36 -0700 (PDT)
Message-ID: <386489f5-e814-403f-9997-849e55345210@rivosinc.com>
Date: Fri, 16 May 2025 16:53:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
 <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
Content-Language: en-US
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_165338_394459_2BB4FAE0 
X-CRM114-Status: GOOD (  21.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDUvMTYvMjUgNToxOCBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBGcmksIE1heSAxNiwg
MjAyNSBhdCA0OjQx4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+IHdyb3Rl
Ogo+PiBTY291bnRlcmVuIENTUiBjb250cm9scyB0aGUgZGlyZWN0IGFjY2VzcyB0aGUgaHBtY291
bnRlcnMgYW5kIGN5Y2xlLwo+PiBpbnN0cmV0L3RpbWUgZnJvbSB0aGUgdXNlcnNwYWNlLiBJdCdz
IHRoZSBzdXBlcnZpc29yJ3MgcmVzcG9uc2liaWxpdHkKPj4gdG8gc2V0IGl0IHVwIGNvcnJlY3Rs
eSBmb3IgaXQncyB1c2VyIHNwYWNlLiBUaGV5IGh5cGVydmlzb3IgZG9lc24ndAo+PiBuZWVkIHRv
IGRlY2lkZSB0aGUgcG9saWN5IG9uIGJlaGFsZiBvZiB0aGUgc3VwZXJ2aXNvci4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiBD
aGFuZ2VzIGluIHYzOgo+PiAtIFJlbW92ZWQgdGhlIHJlZHVuZGFudCBkZWNsYXJhdGlvbgo+PiAt
IExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MTUtZml4X3Njb3Vu
dGVyZW5fdnMtdjItMS0xZmQ4ZGMwNjkzZThAcml2b3NpbmMuY29tCj4+Cj4+IENoYW5nZXMgaW4g
djI6Cj4+IC0gUmVtb3ZlIHRoZSBzY291bnRlcmVuIGluaXRpYWxpemF0aW9uIGluc3RlYWQgb2Yg
anVzdCBzZXR0aW5nIHRoZSBUTSBiaXQuCj4+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI1MDUxMy1maXhfc2NvdW50ZXJlbl92cy12MS0xLWMxZjUyYWY5M2M3OUBy
aXZvc2luYy5jb20KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgNCAtLS0tCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gaW5kZXggNjBkNjg0
Yzc2YzU4Li45YmZhYWU5YTExZWEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUu
Ywo+PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gQEAgLTExMSw3ICsxMTEsNiBAQCBp
bnQga3ZtX2FyY2hfdmNwdV9jcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiAgIHsKPj4g
ICAgICAgICAgaW50IHJjOwo+PiAgICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4
Owo+PiAtICAgICAgIHN0cnVjdCBrdm1fdmNwdV9jc3IgKnJlc2V0X2NzciA9ICZ2Y3B1LT5hcmNo
Lmd1ZXN0X3Jlc2V0X2NzcjsKPj4KPj4gICAgICAgICAgc3Bpbl9sb2NrX2luaXQoJnZjcHUtPmFy
Y2gubXBfc3RhdGVfbG9jayk7Cj4+Cj4+IEBAIC0xNDYsOSArMTQ1LDYgQEAgaW50IGt2bV9hcmNo
X3ZjcHVfY3JlYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPj4gICAgICAgICAgaWYgKGt2bV9y
aXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHZjcHUsIGNudHgpKQo+PiAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pgo+PiAtICAgICAgIC8qIEJ5IGRlZmF1bHQsIG1ha2Ug
Q1ksIFRNLCBhbmQgSVIgY291bnRlcnMgYWNjZXNzaWJsZSBpbiBWVSBtb2RlICovCj4+IC0gICAg
ICAgcmVzZXRfY3NyLT5zY291bnRlcmVuID0gMHg3Owo+PiAtCj4+ICAgICAgICAgIC8qIFNldHVw
IFZDUFUgdGltZXIgKi8KPj4gICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfdGltZXJfaW5pdCh2Y3B1
KTsKPj4KPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0OiAwMWY5NTUwMGExNjJmY2E4OGNlZmFiOWVk
NjRjZWRlZDVhZmFiYzEyCj4+IGNoYW5nZS1pZDogMjAyNTA1MTMtZml4X3Njb3VudGVyZW5fdnMt
ZmRkODYyNTVjN2I3Cj4+IC0tCj4gT3ZlcmFsbCwgdGhpcyBsb29rcyBnb29kLgo+Cj4gUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4KPiBDdXJyZW50bHksIHRo
ZSBzY291bnRlcmVuLlRNIGJpdCBpcyBvbmx5IHNldCBieSB0aGUgTGludXggU0JJIFBNVQo+IGRy
aXZlciBidXQgS1ZNIFJJU0MtViBvbmx5IHByb3ZpZGVzIFNCSSBQTVUgZm9yIGd1ZXN0IHdoZW4K
PiBTc2NvZnBtZiBpcyBhdmFpbGFibGUgaW4gaG9zdCBzbyB3ZSBuZWVkIHRoZSBiZWxvdyBodW5r
IHRvCj4gY29tcGxldGVseSBnZXQgcmlkLW9mZiBzY291bnRlcmVuIGluaXRpYWxpemF0aW9uIGlu
IEtWTSBSSVNDLVYuCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIv
YXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gaW5kZXggMzU2ZDUzOTdiMmEyLi5iZGYzMzUyYWNm
NGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvaGVhZC5TCj4gQEAgLTEzMSw2ICsxMzEsMTIgQEAgc2Vjb25kYXJ5X3N0YXJ0
X3NiaToKPiAgICAgICBjc3J3IENTUl9JRSwgemVybwo+ICAgICAgIGNzcncgQ1NSX0lQLCB6ZXJv
Cj4KPiArI2lmbmRlZiBDT05GSUdfUklTQ1ZfTV9NT0RFCj4gKyAgICAvKiBFbmFibGUgdGltZSBD
U1IgKi8KPiArICAgIGxpIHQwLCAweDIKPiArICAgIGNzcncgQ1NSX1NDT1VOVEVSRU4sIHQwCj4g
KyNlbmRpZgo+ICsKPiAgICAgICAvKiBMb2FkIHRoZSBnbG9iYWwgcG9pbnRlciAqLwo+ICAgICAg
IGxvYWRfZ2xvYmFsX3BvaW50ZXIKPgo+IEBAIC0yMjYsNiArMjMyLDEwIEBAIFNZTV9DT0RFX1NU
QVJUKF9zdGFydF9rZXJuZWwpCj4gICAgICAgICogdG8gaGFuZCBpdCB0byB1cy4KPiAgICAgICAg
Ki8KPiAgICAgICBjc3JyIGEwLCBDU1JfTUhBUlRJRAo+ICsjZWxzZQo+ICsgICAgLyogRW5hYmxl
IHRpbWUgQ1NSICovCj4gKyAgICBsaSB0MCwgMHgyCj4gKyAgICBjc3J3IENTUl9TQ09VTlRFUkVO
LCB0MAo+ICAgI2VuZGlmIC8qIENPTkZJR19SSVNDVl9NX01PREUgKi8KPgo+ICAgICAgIC8qIExv
YWQgdGhlIGdsb2JhbCBwb2ludGVyICovCj4KPiBJIGhhdmUgcXVldWVkIHRoaXMgcGF0Y2ggZm9y
IExpbnV4LTYuMTYgd2l0aCB0aGUgYWJvdmUgaHVuayBzcXVhc2hlZC4KClllcy4gVGhhbmtzIGZv
ciBhZGRpbmcgdGhpcy4KCj4gVGhhbmtzLAo+IEFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
