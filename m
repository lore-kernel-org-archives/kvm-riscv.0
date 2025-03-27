Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCE0C36013
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiUkzMVbRfM/DS+IfDo7JX5uETsIp16MFsi2sm6g/Bs=; b=RsAXgoFEerNLPb
	3cxXhYBLZG3M/iH46U4rhQDVjXh3B5SDqbkSwURaP9MgZRfyb2quWQM3Vsni4/WlnRuF535oBIlyL
	0jXsmdQYaUlPMm+TGtqjB27xE5E3JXBqt95pVisn/aB3bTKKOkPFz0YcFNBaybAYQYDDY4AWqYyM3
	+aoPcneexB9NyuW6xj+W9cRLPLKv+xaBH4ElWeb7do6JoMFofEoq9MtfkKFRbfHcmPmyJq4MirLW9
	Nhjpy6yrrTMBYjPa7SxCIfhyeDnzbMhSHXYErWwPH/13eG0nfUhuQe7kvP0dpGccamXk10frqQ65T
	l/lCuIx9SjlrNsJYlGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtAQ-0000000BsGr-0JAv;
	Thu, 27 Mar 2025 19:45:30 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1d-0000000Bpap-1pfn
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:27 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so1804502a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104185; x=1743708985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUgUK85uZXa6Y/dNTr7Q9E0wfwXHdLdLqKfyUg5SYXI=;
        b=I8fn1h7ozu47fV+59BO/m8nosNg0y8F5UEl2l0sRcjp7fzcMSXgzlko+N6H5TPmITo
         PGE43+OQZXqlbseGQ5piKxIz79z9Zwot/onzOCqCSuDVqwGnJKOlbrD1QgoZy3mGJWyp
         BY6Dx0X3oHTgNojntbKvQ2uqxQ7Dtrw51i3zaS3twX7fyFrfI+Qpm3YCTjr6r4A+iJFW
         vfxlijZxlvBuZwwc7iBJI2RuiP+b74b+JH7lObYjdqFxxiYqoO3JH/MwrFaALGIwE5Nw
         7wk+sIFr13uy6vQ9rXSTT9Ms1A07S4ImrbXFqAeSDnrUQpfLaJN877+OOefNeQpa286X
         J/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104185; x=1743708985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUgUK85uZXa6Y/dNTr7Q9E0wfwXHdLdLqKfyUg5SYXI=;
        b=t5FfAZNHEubamX311zNjHqNlYmO/pLli8bwFPGnZ04fpjPvvEqHSwK+Ejeq3IElpdu
         DDopmnPVyUAOXceNGmV2vu50QcYmPbA6f8vJrK0yEj9fgIX719FArsGksmGilm62pT0A
         bCe4TtKiBBqCub/OBfhassSMtrDL4jjVMrcGgP8hKLadfMWk0iP59lg0Z0s+7SY9H4bh
         RiEe0L5pg9Wz+CTblC3xC788AkVcnO9rOxZ9An8dpZyWQyN+t/XfL9XKGULdA9oqiQBv
         5h0uAmMH1j9rUefYXw21kF/xsOB6TZGzJ+/epCbgsm+MGyLXssIbs8jmP6B3BUsb1g55
         Mz6A==
X-Forwarded-Encrypted: i=1; AJvYcCXY525+vW5r4xthpjNJ03WHBwgo4YAeRUoctbC8La5E9IJwid3dnKd7A64VLlVJ+ewpr3hbknjvrso=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl8gCEowmWC8Z6gG0EiqX9WtTbNuLKyUqGJ387d7ZlMCubR5EE
	B8B0AhAvEuVVzCV/QS9IuQT2C2tGDugCrp4QpBIeBCrwGsttcgCp5j1VVPWdoeg=
X-Gm-Gg: ASbGncvVET3BU+awFpUf38WyYmvRKdIrzm9URohR54Ln/WLkKvIxlsMEMUklbNMVnWu
	pGhFASccoQh7IMUoLnC2GcxAHff48AO5xh+xIdFBNwV7kdydfSjjKNnhfqjNPPF0exis43I9V5V
	uBH4ZuqoeqSoGupq45COeTuyEvAgpVNEuCcBWEUgKZm3kJX6Q2xJW/9ewExsdbLrK6vv5pEYl0K
	hdPQs9HsENk2vTlLhFpz9xCwUpRXafs55Otz08YwiPOIwR/FWIaF8/4FTgVnBuhb3QYLD2MBojS
	DZOP4NZYO4LEfm9GTDh8fMaV7cYaPsuIX3WIA7XnuxQ+zGmBJwzHQzGUjA==
X-Google-Smtp-Source: AGHT+IHsQmzPAsgx/ng9OITR58/G/eBONWXQGgyTGskdwaITzdO2LxTvI25NheeogcoyYSwC74/u/Q==
X-Received: by 2002:a17:90b:2f4d:b0:2fe:8a84:e033 with SMTP id 98e67ed59e1d1-303a7b5a137mr7359505a91.2.1743104184705;
        Thu, 27 Mar 2025 12:36:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:49 -0700
Subject: [PATCH v5 08/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-8-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
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
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123625_502900_CB627577 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+CgpUaGlzIGFkZHMgdGhlIHNj
b3VudGluaGliaXQgQ1NSIGRlZmluaXRpb24gYW5kIFMtbW9kZSBhY2Nlc3NpYmxlIGhwbWV2ZW50
CmJpdHMgZGVmaW5lZCBieSBzbWNkZWxlZy9zc2NjZmcuIHNjb3VudGluaGliaXQgYWxsb3dzIFMt
bW9kZSB0byBzdGFydC9zdG9wCmNvdW50ZXJzIGRpcmVjdGx5IGZyb20gUy1tb2RlIHdpdGhvdXQg
aW52b2tpbmcgU0JJIGNhbGxzIHRvIE0tbW9kZS4gSXQgaXMKYWxzbyB1c2VkIHRvIGZpZ3VyZSBv
dXQgdGhlIGNvdW50ZXJzIGRlbGVnYXRlZCB0byBTLW1vZGUgYnkgdGhlIE0tbW9kZSBhcwp3ZWxs
LgoKU2lnbmVkLW9mZi1ieTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+ClJldmll
d2VkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jc3IuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCmluZGV4IGJj
ZTU2YTgzYzM4NC4uM2QyZDRmODg2Yzc3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2Nzci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKQEAgLTIzMCw2ICsy
MzAsMzEgQEAKICNkZWZpbmUgU01TVEFURUVOMF9IU0VOVkNGRwkJKF9VTEwoMSkgPDwgU01TVEFU
RUVOMF9IU0VOVkNGR19TSElGVCkKICNkZWZpbmUgU01TVEFURUVOMF9TU1RBVEVFTjBfU0hJRlQJ
NjMKICNkZWZpbmUgU01TVEFURUVOMF9TU1RBVEVFTjAJCShfVUxMKDEpIDw8IFNNU1RBVEVFTjBf
U1NUQVRFRU4wX1NISUZUKQorLyogSFBNRVZFTlQgYml0cy4gVGhlc2UgYXJlIGFjY2Vzc2libGUg
aW4gUy1tb2RlIHZpYSBTbWNkZWxlZy9Tc2NjZmcgKi8KKyNpZmRlZiBDT05GSUdfNjRCSVQKKyNk
ZWZpbmUgSFBNRVZFTlRfT0YJCQkoQklUX1VMTCg2MykpCisjZGVmaW5lIEhQTUVWRU5UX01JTkgJ
CQkoQklUX1VMTCg2MikpCisjZGVmaW5lIEhQTUVWRU5UX1NJTkgJCQkoQklUX1VMTCg2MSkpCisj
ZGVmaW5lIEhQTUVWRU5UX1VJTkgJCQkoQklUX1VMTCg2MCkpCisjZGVmaW5lIEhQTUVWRU5UX1ZT
SU5ICQkJKEJJVF9VTEwoNTkpKQorI2RlZmluZSBIUE1FVkVOVF9WVUlOSAkJCShCSVRfVUxMKDU4
KSkKKyNlbHNlCisjZGVmaW5lIEhQTUVWRU5USF9PRgkJCShCSVRfVUxMKDMxKSkKKyNkZWZpbmUg
SFBNRVZFTlRIX01JTkgJCQkoQklUX1VMTCgzMCkpCisjZGVmaW5lIEhQTUVWRU5USF9TSU5ICQkJ
KEJJVF9VTEwoMjkpKQorI2RlZmluZSBIUE1FVkVOVEhfVUlOSAkJCShCSVRfVUxMKDI4KSkKKyNk
ZWZpbmUgSFBNRVZFTlRIX1ZTSU5ICQkJKEJJVF9VTEwoMjcpKQorI2RlZmluZSBIUE1FVkVOVEhf
VlVJTkgJCQkoQklUX1VMTCgyNikpCisKKyNkZWZpbmUgSFBNRVZFTlRfT0YJCQkoSFBNRVZFTlRI
X09GIDw8IDMyKQorI2RlZmluZSBIUE1FVkVOVF9NSU5ICQkJKEhQTUVWRU5USF9NSU5IIDw8IDMy
KQorI2RlZmluZSBIUE1FVkVOVF9TSU5ICQkJKEhQTUVWRU5USF9TSU5IIDw8IDMyKQorI2RlZmlu
ZSBIUE1FVkVOVF9VSU5ICQkJKEhQTUVWRU5USF9VSU5IIDw8IDMyKQorI2RlZmluZSBIUE1FVkVO
VF9WU0lOSAkJCShIUE1FVkVOVEhfVlNJTkggPDwgMzIpCisjZGVmaW5lIEhQTUVWRU5UX1ZVSU5I
CQkJKEhQTUVWRU5USF9WVUlOSCA8PCAzMikKKyNlbmRpZgorCisjZGVmaW5lIFNJU0VMRUNUX1NT
Q0NGR19CQVNFCQkweDQwCiAKIC8qIG1zZWNjZmcgYml0cyAqLwogI2RlZmluZSBNU0VDQ0ZHX1BN
TQkJCUVOVkNGR19QTU0KQEAgLTMxMSw2ICszMzYsNyBAQAogI2RlZmluZSBDU1JfU0NPVU5URVJF
TgkJMHgxMDYKICNkZWZpbmUgQ1NSX1NFTlZDRkcJCTB4MTBhCiAjZGVmaW5lIENTUl9TU1RBVEVF
TjAJCTB4MTBjCisjZGVmaW5lIENTUl9TQ09VTlRJTkhJQklUCTB4MTIwCiAjZGVmaW5lIENTUl9T
U0NSQVRDSAkJMHgxNDAKICNkZWZpbmUgQ1NSX1NFUEMJCTB4MTQxCiAjZGVmaW5lIENTUl9TQ0FV
U0UJCTB4MTQyCgotLSAKMi40My4wCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
