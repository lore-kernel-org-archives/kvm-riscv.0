Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC3BC02192
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KylYJhbms6Z6Rf67jnIBLG8fRgZOKipwSjwnmPaKEus=; b=steyR/NB+cBFiE
	yp+M/gFA0wqJdYl8OHGW+FtxVMjdsUvUqtepd2tQM7l7Q3wxbSr7tbY1AQ3diXFvFlettFqQNCti4
	kKIL/uBir44S0ggqSEKY5x0sfMch/6xZgNDuIh8DlPbd6jrwNBjGoGEW91NF27OyoEJd24fIjOFGR
	DFPdF/hooyBFjjshTsKAgFkRUYZkOLH2d5PEQjjUEbKK25Qg2OpxTmlBExf0MRo7hyU3dg8kTJNNM
	WMl/8Y1cs9YL8FKCBH/tQ/p00pKUE3SVyt9JgLOkb+v6N8ezd8dHAbDPgpnQBSQSmaAjOQnPRhprA
	B4jlsFx7vif8JJ1QehEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJFL-00000008iRN-35zZ;
	Fri, 07 Feb 2025 07:57:55 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJFI-00000008iPc-2mzy
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 07:57:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so835544f8f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 06 Feb 2025 23:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738915071; x=1739519871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+8W0r1eBfeQeUIpnApB8DWC5KBFE4067O0DEyXdDjM=;
        b=ShG5eMw9SDaWotoiGAqQ9XAd5Ohg9mbGo38I86fh2abT2FjXy1471lgWgIZTHeQOPf
         w+BTEjDKHix9CxoZU+uAyT2LDj7rLb+SSX/zIUZV+2v6BDjC48Wc3Ns8/HgQ5rvZ+0Y8
         uBjWvoYNTmdDqWx1JxkODU8PM82KpFnezuFQIXI/RWaMXKYJwtCZI8OtlCCqeKrCRqUF
         22UNqqHvoD2Uy+uu6rt++k1GGvM0f45cfRC9sqLNJswqVNeZTXBGkKeOFaZR1NiA295D
         o/I0Fv34zXi9wltYBaNcSUcjVxxzpjBypDtnjSXtkRYbopPfhy5YyYg4yhb128Z7IJrv
         6dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915071; x=1739519871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+8W0r1eBfeQeUIpnApB8DWC5KBFE4067O0DEyXdDjM=;
        b=DlEPyLHXNWpdJSH2ZMTkFWj2k/0iM99bigZcB40j0mbY37BFtc54hYC3xMc2Tia87l
         aEP6rUEJEDSo8/0oZ1OrIInrCPo/H/oGqtw8FrL5BRdUhjy5+svrNmppKI4r7mmVx9zE
         QYbq+jubo5J0I9Kq4EoqGJMaVsSsVK0HIL+7fQoJp0/RXLFLtSyfhUnyyO4ImId2wr2f
         m6Eh2QWsGtFLUSA/1RbJ2n6GH6MsYa5QxhjNtkmiHY26z+pnqO6u4RdaSclj8NsijuBO
         aoIEZJW9KHMC0HCcs9nRcRkAglq1904IMy2CA9MvRFn2UuZY2kAqyBvzs1IsA6lKZZAS
         XlAw==
X-Forwarded-Encrypted: i=1; AJvYcCX6pvIPw4X2vaL8gJLNVoDxBFashJcC9RKrpMTyWlnaOmd1rM/JyhawmTxo1lG0vD09lsf+BCjHWE8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjCxUuzNfIojgGe6leN3Qms/gXKZY1RbxGHhgXeS5Aku0aJ6M0
	XJXnQRPrkEpOXMytbmF6SohjV80lDUeWlx/meOkVBSZChS0H6nrZMg9nSjWeevQ=
X-Gm-Gg: ASbGncvU9pLmsR4TqIpRYtWI00PNnFx70ihtm5M144TwYbx3+jYWBjYa/TxzOxl/7W9
	nTfMckao7BIH61b6zodEqTk26FjyXNR94b2BReesZ82lUROSm0XCKWQXTFdLv5ChfbuKPkBGgAk
	IZfq0dBSkb9OvQdeFi/JdyxOxxTNtIZuyJUHPAZg2BSHlR19hshjHsVeE52z/mgQNFzOeZ0rL9T
	30fHfI9y7XwoMQLenV2MsqIgvnEUM5VTIhfIc5VlCoAObzmGOtX8azDiZrmabhcCVuf7AeL74xa
	GJTIqolqiY0bLPV/vcBwWnSpzp7oB5qfISWI33YHXgGNAfY2b8CwBjn3YmKY
X-Google-Smtp-Source: AGHT+IGq74MwyyBs38GAGswE+10Qup4jIp3Pg2RgGuSrurMbFniM8/Z3Fz5NjAT2LPHjyfZgPXz2qQ==
X-Received: by 2002:a5d:64ee:0:b0:38d:ac77:d7cb with SMTP id ffacd0b85a97d-38dc8dd105bmr1267323f8f.25.1738915070831;
        Thu, 06 Feb 2025 23:57:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ff64sm44791635e9.9.2025.02.06.23.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 23:57:50 -0800 (PST)
Message-ID: <76865725-35ce-48c6-822f-ea6cf817cee3@rivosinc.com>
Date: Fri, 7 Feb 2025 08:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 Kaiwen Xue <kaiwenx@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-2-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_235752_891300_942FB420 
X-CRM114-Status: GOOD (  14.38  )
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

CgpPbiAwNi8wMi8yMDI1IDA4OjIzLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBGcm9tOiBLYWl3ZW4g
WHVlIDxrYWl3ZW54QHJpdm9zaW5jLmNvbT4KPiAKPiBUaGlzIGFkZHMgZGVmaW5pdGlvbnMgb2Yg
bmV3IENTUnMgYW5kIGJpdHMgZGVmaW5lZCBpbiBTeGNzcmluZCBJU0EKPiBleHRlbnNpb24uIFRo
ZXNlIENTUiBlbmFibGVzIGluZGlyZWN0IGFjY2Vzc2VzIG1lY2hhbmlzbSB0byBhY2Nlc3MKPiBh
bnkgQ1NScyBpbiBNLSwgUy0sIGFuZCBWUy1tb2RlLiBUaGUgcmFuZ2Ugb2YgdGhlIHNlbGVjdCB2
YWx1ZXMKPiBhbmQgaXJlZyB3aWxsIGJlIGRlZmluZSBieSB0aGUgSVNBIGV4dGVuc2lvbiB1c2lu
ZyBTeGNzcmluZCBleHRlbnNpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogS2Fpd2VuIFh1ZSA8a2Fp
d2VueEByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEBy
aXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggfCAzMCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCAzN2JkZWE2NWJiZDguLjJhZDJk
NDkyZTZiNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC0zMTgsNiArMzE4LDEyIEBACj4g
IC8qIFN1cGVydmlzb3ItTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0
ZXJzIChBSUEpICovCj4gICNkZWZpbmUgQ1NSX1NJU0VMRUNUCQkweDE1MAo+ICAjZGVmaW5lIENT
Ul9TSVJFRwkJMHgxNTEKPiArLyogU3VwZXJ2aXNvci1MZXZlbCBXaW5kb3cgdG8gSW5kaXJlY3Rs
eSBBY2Nlc3NlZCBSZWdpc3RlcnMgKFN4Y3NyaW5kKSAqLwo+ICsjZGVmaW5lIENTUl9TSVJFRzIJ
CTB4MTUyCj4gKyNkZWZpbmUgQ1NSX1NJUkVHMwkJMHgxNTMKPiArI2RlZmluZSBDU1JfU0lSRUc0
CQkweDE1NQo+ICsjZGVmaW5lIENTUl9TSVJFRzUJCTB4MTU2Cj4gKyNkZWZpbmUgQ1NSX1NJUkVH
NgkJMHgxNTcKPiAgCj4gIC8qIFN1cGVydmlzb3ItTGV2ZWwgSW50ZXJydXB0cyAoQUlBKSAqLwo+
ICAjZGVmaW5lIENTUl9TVE9QRUkJCTB4MTVjCj4gQEAgLTM2NSw2ICszNzEsMTQgQEAKPiAgLyog
VlMtTGV2ZWwgV2luZG93IHRvIEluZGlyZWN0bHkgQWNjZXNzZWQgUmVnaXN0ZXJzIChILWV4dGVu
c2lvbiB3aXRoIEFJQSkgKi8KPiAgI2RlZmluZSBDU1JfVlNJU0VMRUNUCQkweDI1MAo+ICAjZGVm
aW5lIENTUl9WU0lSRUcJCTB4MjUxCj4gKy8qCj4gKyAqIFZTLUxldmVsIFdpbmRvdyB0byBJbmRp
cmVjdGx5IEFjY2Vzc2VkIFJlZ2lzdGVycyAoSC1leHRlbnNpb24gd2l0aCBTeGNzcmluZCkKPiAr
ICovCj4gKyNkZWZpbmUgQ1NSX1ZTSVJFRzIJCTB4MjUyCj4gKyNkZWZpbmUgQ1NSX1ZTSVJFRzMJ
CTB4MjUzCj4gKyNkZWZpbmUgQ1NSX1ZTSVJFRzQJCTB4MjU1Cj4gKyNkZWZpbmUgQ1NSX1ZTSVJF
RzUJCTB4MjU2Cj4gKyNkZWZpbmUgQ1NSX1ZJU1JFRzYJCTB4MjU3Cj4gIAo+ICAvKiBWUy1MZXZl
bCBJbnRlcnJ1cHRzIChILWV4dGVuc2lvbiB3aXRoIEFJQSkgKi8KPiAgI2RlZmluZSBDU1JfVlNU
T1BFSQkJMHgyNWMKPiBAQCAtNDA3LDYgKzQyMSwxMiBAQAo+ICAvKiBNYWNoaW5lLUxldmVsIFdp
bmRvdyB0byBJbmRpcmVjdGx5IEFjY2Vzc2VkIFJlZ2lzdGVycyAoQUlBKSAqLwo+ICAjZGVmaW5l
IENTUl9NSVNFTEVDVAkJMHgzNTAKPiAgI2RlZmluZSBDU1JfTUlSRUcJCTB4MzUxCj4gKy8qIE1h
Y2hpbmUtTGV2ZWwgV2luZG93IHRvIEluZHJlY2l0bHkgQWNjZXNzZWQgUmVnaXN0ZXJzIChTeGNz
cmluZCkgKi8KClR5cG86IHMvSW5kcmVjaXRseS9JbmRpcmVjdGx5Cgo+ICsjZGVmaW5lIENTUl9N
SVJFRzIJCTB4MzUyCj4gKyNkZWZpbmUgQ1NSX01JUkVHMwkJMHgzNTMKPiArI2RlZmluZSBDU1Jf
TUlSRUc0CQkweDM1NQo+ICsjZGVmaW5lIENTUl9NSVJFRzUJCTB4MzU2Cj4gKyNkZWZpbmUgQ1NS
X01JUkVHNgkJMHgzNTcKPiAgCj4gIC8qIE1hY2hpbmUtTGV2ZWwgSW50ZXJydXB0cyAoQUlBKSAq
Lwo+ICAjZGVmaW5lIENTUl9NVE9QRUkJCTB4MzVjCj4gQEAgLTQ1Miw2ICs0NzIsMTEgQEAKPiAg
IyBkZWZpbmUgQ1NSX0lFSAkJQ1NSX01JRUgKPiAgIyBkZWZpbmUgQ1NSX0lTRUxFQ1QJQ1NSX01J
U0VMRUNUCj4gICMgZGVmaW5lIENTUl9JUkVHCUNTUl9NSVJFRwo+ICsjIGRlZmluZSBDU1JfSVJF
RzIJQ1NSX01JUkVHMgo+ICsjIGRlZmluZSBDU1JfSVJFRzMJQ1NSX01JUkVHMwo+ICsjIGRlZmlu
ZSBDU1JfSVJFRzQJQ1NSX01JUkVHNAo+ICsjIGRlZmluZSBDU1JfSVJFRzUJQ1NSX01JUkVHNQo+
ICsjIGRlZmluZSBDU1JfSVJFRzYJQ1NSX01JUkVHNgo+ICAjIGRlZmluZSBDU1JfSVBICQlDU1Jf
TUlQSAo+ICAjIGRlZmluZSBDU1JfVE9QRUkJQ1NSX01UT1BFSQo+ICAjIGRlZmluZSBDU1JfVE9Q
SQlDU1JfTVRPUEkKPiBAQCAtNDc3LDYgKzUwMiwxMSBAQAo+ICAjIGRlZmluZSBDU1JfSUVICQlD
U1JfU0lFSAo+ICAjIGRlZmluZSBDU1JfSVNFTEVDVAlDU1JfU0lTRUxFQ1QKPiAgIyBkZWZpbmUg
Q1NSX0lSRUcJQ1NSX1NJUkVHCj4gKyMgZGVmaW5lIENTUl9JUkVHMglDU1JfU0lSRUcyCj4gKyMg
ZGVmaW5lIENTUl9JUkVHMwlDU1JfU0lSRUczCj4gKyMgZGVmaW5lIENTUl9JUkVHNAlDU1JfU0lS
RUc0Cj4gKyMgZGVmaW5lIENTUl9JUkVHNQlDU1JfU0lSRUc1Cj4gKyMgZGVmaW5lIENTUl9JUkVH
NglDU1JfU0lSRUc2Cj4gICMgZGVmaW5lIENTUl9JUEgJCUNTUl9TSVBICj4gICMgZGVmaW5lIENT
Ul9UT1BFSQlDU1JfU1RPUEVJCj4gICMgZGVmaW5lIENTUl9UT1BJCUNTUl9TVE9QSQo+IApXaXRo
IHRoYXQgdHlwbyBmaXhlZDoKClJldmlld2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
