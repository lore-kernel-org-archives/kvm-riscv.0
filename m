Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70413C83F17
	for <kvm-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 04:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGH9iDcdhjHa3vlU+ibDme1WDVI4iqjMRTY0uCjVRts=; b=LZzZ8c3ms48GSh
	AUxHkNE6scmBTOV949cEKnQSu+sVXG8J23ZPdx29HQCYCIbYptEqqSmxHQgzIA4pHmbtQ6xn4h2Hq
	NT06eF4NM4eZkHf9H3XE6vTn257S0Oxndcmda35ez4LMRZF/Q2RZlPhaLmyb1KqhII5EB9V7bp/Mx
	uJCfj/3OsPExwjfjWTHhunT0LzKkxeYLLWVbe5fLvzLNcLLajjKeIYIT+qobhSpqLy7A56ikkaI6c
	d4SmoAv8fbUOs+CpX/I0hjFDOUF9pjMRgB42MeVcJXaakVvefQ07vg1M4OzksRnsohOXPTt49LQf/
	HYNkTkwFY34j9NVxBvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccou-0000000BfQm-0JTs;
	Fri, 18 Jul 2025 04:35:40 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uccmQ-0000000BfDa-1ttR
	for kvm-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 04:33:08 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-87b92a32bb0so137154539f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 21:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752813185; x=1753417985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BchHT2JqinVts/UeZMPzWB77o6GrLS5pyW1xcQuRic=;
        b=SNYb5LQ6lFafok8yAXgS/+ZRCn/gCbEdYzd36LziXcoJpYZcs7tFQqUCPFXcTwZ37R
         TCbImB926ejyMM6dTXvgjIOBuy/cBvzl5o1iiXMLMLcBtSDvJNhIWmkT5XyfoOIFh5qe
         hlYfIdGsj+loWQ0aRRNJdNEmzBfDWgO3Ytmj9iHhEycoE6cASPYJkw0wukbixlKqcTNX
         BevG0xmGq5+l4cZi3bFuzKvOPfLnqZ+FiVrh8k6iW129+x09yoV0AmOd2bJItJk2SaIP
         nuwU/+pbdH+vfNWZvw6OWfy6LzpQ7qBXfbc1qpSIEQq1ccKCO1IhwgluRsRo3Aq4/tN9
         bEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752813185; x=1753417985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BchHT2JqinVts/UeZMPzWB77o6GrLS5pyW1xcQuRic=;
        b=shsqjfTLBfqZhJYh4nYlxB17qYTL9xlYgEs3fKSh66Lrhbsxpk30EZViEGghiNmOkB
         QK1tpCs2ollIk1St/8sI2qwOZl13cuHWdY7V9Dxt+xr/sQsSHXKk9Sk61cFHfSh8w7Wx
         86khYxcQIZLpuE2HYSO6bJkIVD8DzWAabuJ/ThONvrxStTm89nnU6nyWTRBIWbj0RvXa
         F21gb9Ac4LEJzSoCSc+zXNrFdzgiSyFnvrrEB4v+LCMIjpYVFYohKjBHwxMCZVgnR2u4
         vwrSVfR2fDdICOXMmNnn3WYn5F88P4pHiET9JQ6I/4i5stsFD45V3kYiwaU0z2mLHQtg
         jpVg==
X-Forwarded-Encrypted: i=1; AJvYcCXitJ32hbu9NCisvvHxVJoPSINF/j4NjqWy8Xz2Sqx9vwIPP77Zb1cx818VHt2q4uVrLa9+rJRRPfM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfr1uJzqFVly/SmwRywp+sAs2rfOIXF3txWyi1YjDhK/21JpWp
	5/bkFGj0jBPNKeYM3WyR3rnhMNImitPxUambBizGor259f/VqDc3xn+5nTigkBNJ7ivp8tzlLgn
	cHK7fOnc7RKBduDelP+Jw9hDJPunCo/uwPSeBcloK0w==
X-Gm-Gg: ASbGnctV5kXridH96PwP6VSiV/yRKZx32VWLQ3dmrt0Sv3ewxHzzDB5YaZAhEBj64hw
	gmQys/ekEZNfE1DoHS+f8yt6ZPiExG7IukiOyAYBMoR9PzJRsCro1rjziwLYVW+WyLxrwCyI6mt
	wZNnHD8rErWyelTZpEb18LWxi8zDW4gjqMAyx+a8NUyfO6jYAaFk147eVH7QteTRmJkq8YiaY8D
	L/7lsqB
X-Google-Smtp-Source: AGHT+IGxLSLfJEWbT94QQ9wDEPcHHk7UU5oQFPXNoEg2dmlbQDZqZkULuKjbXMOnhCheEHP/8Vs0hjk7tTvXdvuroqU=
X-Received: by 2002:a05:6e02:1488:b0:3e2:8172:25e3 with SMTP id
 e9e14a558f8ab-3e282e3961cmr83450795ab.14.1752813185443; Thu, 17 Jul 2025
 21:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-4-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Jul 2025 10:02:53 +0530
X-Gm-Features: Ac12FXz8CojGLXC08fo8TuectN9PJto19GIlEKkPXZw46d0UC0i4fpJCDCQw5Dc
Message-ID: <CAAhSdy1RyJyjus_SUOw7GUZsQLr5SFV4TZ9d7K1OEKDR27TaWQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] drivers/perf: riscv: Implement PMU event info function
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_213306_581666_1C03C500 
X-CRM114-Status: GOOD (  24.46  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBXaXRoIHRoZSBuZXcgU0JJIFBNVSBldmVudCBpbmZvIGZ1
bmN0aW9uLCB3ZSBjYW4gcXVlcnkgdGhlIGF2YWlsYWJpbGl0eQo+IG9mIHRoZSBhbGwgc3RhbmRh
cmQgU0JJIFBNVSBldmVudHMgYXQgYm9vdCB0aW1lIHdpdGggYSBzaW5nbGUgZWNhbGwuCj4gVGhp
cyBpbXByb3ZlcyB0aGUgYm9vdGltZSBieSBhdm9pZGluZyBtYWtpbmcgYW4gU0JJIGNhbGwgZm9y
IGVhY2gKPiBzdGFuZGFyZCBQTVUgZXZlbnQuIFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgZGVmaW5l
ZCBvbmx5IGluIFNCSSB2My4wLAo+IGludm9rZSB0aGlzIG9ubHkgaWYgdGhlIHVuZGVybHlpbmcg
U0JJIGltcGxlbWVudGF0aW9uIGlzIHYzLjAgb3IgaGlnaGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmggfCAgOSArKysrKysKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gaW5k
ZXggNmNlMzg1YTNhN2JiLi43N2I2OTk3ZWI2YzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiBA
QCAtMTM1LDYgKzEzNSw3IEBAIGVudW0gc2JpX2V4dF9wbXVfZmlkIHsKPiAgICAgICAgIFNCSV9F
WFRfUE1VX0NPVU5URVJfRldfUkVBRCwKPiAgICAgICAgIFNCSV9FWFRfUE1VX0NPVU5URVJfRldf
UkVBRF9ISSwKPiAgICAgICAgIFNCSV9FWFRfUE1VX1NOQVBTSE9UX1NFVF9TSE1FTSwKPiArICAg
ICAgIFNCSV9FWFRfUE1VX0VWRU5UX0dFVF9JTkZPLAo+ICB9Owo+Cj4gIHVuaW9uIHNiaV9wbXVf
Y3RyX2luZm8gewo+IEBAIC0xNTgsNiArMTU5LDE0IEBAIHN0cnVjdCByaXNjdl9wbXVfc25hcHNo
b3RfZGF0YSB7Cj4gICAgICAgICB1NjQgcmVzZXJ2ZWRbNDQ3XTsKPiAgfTsKPgo+ICtzdHJ1Y3Qg
cmlzY3ZfcG11X2V2ZW50X2luZm8gewo+ICsgICAgICAgdTMyIGV2ZW50X2lkeDsKPiArICAgICAg
IHUzMiBvdXRwdXQ7Cj4gKyAgICAgICB1NjQgZXZlbnRfZGF0YTsKPiArfTsKPiArCj4gKyNkZWZp
bmUgUklTQ1ZfUE1VX0VWRU5UX0lORk9fT1VUUFVUX01BU0sgMHgwMQo+ICsKPiAgI2RlZmluZSBS
SVNDVl9QTVVfUkFXX0VWRU5UX01BU0sgR0VOTUFTS19VTEwoNDcsIDApCj4gICNkZWZpbmUgUklT
Q1ZfUE1VX1BMQVRfRldfRVZFTlRfTUFTSyBHRU5NQVNLX1VMTCg2MSwgMCkKPiAgLyogU0JJIHYz
LjAgYWxsb3dzIGV4dGVuZGVkIGhwbWV2ZW50WCB3aWR0aCB2YWx1ZSAqLwo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwo+IGluZGV4IDI3M2VkNzAwOThhMy4uMzNkODM0OGJmNjhhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiArKysgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11
X3NiaS5jCj4gQEAgLTI5OSw2ICsyOTksNjYgQEAgc3RhdGljIHN0cnVjdCBzYmlfcG11X2V2ZW50
X2RhdGEgcG11X2NhY2hlX2V2ZW50X21hcFtQRVJGX0NPVU5UX0hXX0NBQ0hFX01BWF0KPiAgICAg
ICAgIH0sCj4gIH07Cj4KPiArc3RhdGljIGludCBwbXVfc2JpX2NoZWNrX2V2ZW50X2luZm8odm9p
ZCkKPiArewo+ICsgICAgICAgaW50IG51bV9ldmVudHMgPSBBUlJBWV9TSVpFKHBtdV9od19ldmVu
dF9tYXApICsgUEVSRl9DT1VOVF9IV19DQUNIRV9NQVggKgo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICBQRVJGX0NPVU5UX0hXX0NBQ0hFX09QX01BWCAqIFBFUkZfQ09VTlRfSFdfQ0FDSEVfUkVT
VUxUX01BWDsKPiArICAgICAgIHN0cnVjdCByaXNjdl9wbXVfZXZlbnRfaW5mbyAqZXZlbnRfaW5m
b19zaG1lbTsKPiArICAgICAgIHBoeXNfYWRkcl90IGJhc2VfYWRkcjsKPiArICAgICAgIGludCBp
LCBqLCBrLCByZXN1bHQgPSAwLCBjb3VudCA9IDA7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpcmV0IHJl
dDsKPiArCj4gKyAgICAgICBldmVudF9pbmZvX3NobWVtID0ga2NhbGxvYyhudW1fZXZlbnRzLCBz
aXplb2YoKmV2ZW50X2luZm9fc2htZW0pLCBHRlBfS0VSTkVMKTsKPiArICAgICAgIGlmICghZXZl
bnRfaW5mb19zaG1lbSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsg
ICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50X21hcCk7IGkrKykK
PiArICAgICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5ldmVudF9pZHggPSBw
bXVfaHdfZXZlbnRfbWFwW2ldLmV2ZW50X2lkeDsKPiArCj4gKyAgICAgICBmb3IgKGkgPSAwOyBp
IDwgQVJSQVlfU0laRShwbXVfY2FjaGVfZXZlbnRfbWFwKTsgaSsrKSB7Cj4gKyAgICAgICAgICAg
ICAgIGZvciAoaiA9IDA7IGogPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXBbaV0pOyBq
KyspIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGsgPSAwOyBrIDwgQVJSQVlfU0la
RShwbXVfY2FjaGVfZXZlbnRfbWFwW2ldW2pdKTsgaysrKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZXZlbnRfaW5mb19zaG1lbVtjb3VudCsrXS5ldmVudF9pZHggPQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG11X2Nh
Y2hlX2V2ZW50X21hcFtpXVtqXVtrXS5ldmVudF9pZHg7Cj4gKyAgICAgICAgICAgICAgIH0KPiAr
ICAgICAgIH0KPiArCj4gKyAgICAgICBiYXNlX2FkZHIgPSBfX3BhKGV2ZW50X2luZm9fc2htZW0p
Owo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiArICAgICAgICAgICAg
ICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BNVV9FVkVOVF9HRVRfSU5G
TywgbG93ZXJfMzJfYml0cyhiYXNlX2FkZHIpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdXBwZXJfMzJfYml0cyhiYXNlX2FkZHIpLCBjb3VudCwgMCwgMCwgMCk7Cj4gKyAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJ
X0VYVF9QTVVfRVZFTlRfR0VUX0lORk8sIGJhc2VfYWRkciwgMCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvdW50LCAwLCAwLCAwKTsKPiArICAgICAgIGlmIChyZXQuZXJyb3Ip
IHsKPiArICAgICAgICAgICAgICAgcmVzdWx0ID0gLUVPUE5PVFNVUFA7Cj4gKyAgICAgICAgICAg
ICAgIGdvdG8gZnJlZV9tZW07Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsg
aSA8IEFSUkFZX1NJWkUocG11X2h3X2V2ZW50X21hcCk7IGkrKykgewo+ICsgICAgICAgICAgICAg
ICBpZiAoIShldmVudF9pbmZvX3NobWVtW2ldLm91dHB1dCAmIFJJU0NWX1BNVV9FVkVOVF9JTkZP
X09VVFBVVF9NQVNLKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwbXVfaHdfZXZlbnRfbWFw
W2ldLmV2ZW50X2lkeCA9IC1FTk9FTlQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgY291bnQg
PSBBUlJBWV9TSVpFKHBtdV9od19ldmVudF9tYXApOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKHBtdV9jYWNoZV9ldmVudF9tYXApOyBpKyspIHsKPiArICAgICAgICAg
ICAgICAgZm9yIChqID0gMDsgaiA8IEFSUkFZX1NJWkUocG11X2NhY2hlX2V2ZW50X21hcFtpXSk7
IGorKykgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGZvciAoayA9IDA7IGsgPCBBUlJBWV9T
SVpFKHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal0pOyBrKyspIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmICghKGV2ZW50X2luZm9fc2htZW1bY291bnRdLm91dHB1dCAmCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9QTVVfRVZFTlRfSU5G
T19PVVRQVVRfTUFTSykpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBtdV9jYWNoZV9ldmVudF9tYXBbaV1bal1ba10uZXZlbnRfaWR4ID0gLUVOT0VOVDsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvdW50Kys7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgfQo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICtmcmVlX21lbToK
PiArICAgICAgIGtmcmVlKGV2ZW50X2luZm9fc2htZW0pOwo+ICsKPiArICAgICAgIHJldHVybiBy
ZXN1bHQ7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHBtdV9zYmlfY2hlY2tfZXZlbnQoc3RydWN0
IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBzYmlyZXQg
cmV0Owo+IEBAIC0zMTYsNiArMzc2LDE0IEBAIHN0YXRpYyB2b2lkIHBtdV9zYmlfY2hlY2tfZXZl
bnQoc3RydWN0IHNiaV9wbXVfZXZlbnRfZGF0YSAqZWRhdGEpCj4KPiAgc3RhdGljIHZvaWQgcG11
X3NiaV9jaGVja19zdGRfZXZlbnRzKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgewo+ICsg
ICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBpZiAoc2JpX3YzX2F2YWlsYWJsZSkgewo+ICsg
ICAgICAgICAgICAgICByZXQgPSBwbXVfc2JpX2NoZWNrX2V2ZW50X2luZm8oKTsKPiArICAgICAg
ICAgICAgICAgaWYgKCFyZXQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwoKV2Ug
c2hvdWxkIG5vdCBmYWxsIGJhY2sgdG8gdGhlIG9sZCB3YXkgaWYgcmV0ICE9IDAuIFJhdGhlciwK
dGhlIHBtdV9zYmlfY2hlY2tfc3RkX2V2ZW50cygpIHNob3VsZCByZXR1cm4gZmFpbHVyZSBpZgpw
bXVfc2JpX2NoZWNrX2V2ZW50X2luZm8oKSBmYWlscy4KCj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgZm9yIChpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHBtdV9od19ldmVudF9tYXApOyBpKysp
Cj4gICAgICAgICAgICAgICAgIHBtdV9zYmlfY2hlY2tfZXZlbnQoJnBtdV9od19ldmVudF9tYXBb
aV0pOwo+Cj4KPiAtLQo+IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
