Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C85C83F07
	for <kvm-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmbP5EBSBrcivHcZVeIRPjbpxrvILZf2wRsDDwZMEKU=; b=mDnlmWOFBZlrqV
	dT1DgKuEOfeNnJASOrKw2NekEQVBadYqFG/f0AfDaXZm2TOoEKf85/gRA7zgdiLn2/od/SkubMBwp
	zgjIkIFOIy4opsjRzB0WZhxhx7/pLYktcH0yW5wjDAf6I3VQoZ8RKojd7YFPc/JBTiyKn4mYiwfq1
	VBUwEnIO2ADhVkbglE9F86vKqrxQupXn7va28ZnwSWTHisRX8riZeuUGan4RscPSx50W/4bOPNSTT
	NAZ/X9jrrRrCxCUxjAIjhD7oG7dEvMIX9fW6Rkug3KsfvRpU+bUoNj2lJKXZCP4eYJMrwU4z5DflJ
	l7ZhZlJ9+NXyp88c3vTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYngq-00000002qNJ-3Rp3;
	Mon, 07 Jul 2025 15:23:32 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnUZ-00000002on3-0rHc
	for kvm-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 15:10:52 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4079f80ff0fso3051732b6e.1
        for <kvm-riscv@lists.infradead.org>; Mon, 07 Jul 2025 08:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751901050; x=1752505850; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnKl3T+2/Gli3SYuDP6kSnPnrKRp+JeV5lf6ObCVcU4=;
        b=NqQnc55rJtK28atokwWLSVhyz11FMbZazEAZ5Ncx3OxHdWO0a79sd16Ia0ypBdNJ5n
         k0Ek6ZO/923X1FWIOecrK8UX1f+V5x4vcy7wAXwCx89Ba8XgX6zdLNRT44CNPutswnvz
         +HHxwYW7bLZ66oZzLnhkRCz6PH1z+VcjGWqm5qVj1Z5RA2Tfq8JGwixSQ8en9YfuHzqs
         kp1MW8cDA/q7DWYPYXI3c1uUJ0YmthRiPb4c12FqOB4mA89jo6ClA/OqmlTJvsKKJoWz
         /fMfblU/asqhUWuPFHDyW/hMfCfe0fNDBuYycDsuyWwiG3pr8B1UWOLwX6gU14dsumec
         N/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751901050; x=1752505850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnKl3T+2/Gli3SYuDP6kSnPnrKRp+JeV5lf6ObCVcU4=;
        b=cqaCQi1a5pbUT5iX0T3yPZEgeZniUwyTen3ystFEDdkXl1WHYhEH8AX/Z8I9nwm6QQ
         pqNbr8r3D+y0zzGDbXDd+tM4CLcFsN3ZOp/Z52X+1xvvdWaeS86hf1y4XyrEtudVM7EW
         0QEtXV2xj2pVJmipaOmPSzcc7fnLUdAS5DEFzBv+4MCHOHDfdXhuSfk2yjRwVTVyZzE1
         6gaXUFn5UdDM3wBlAcP/Gcv5gijccmmCZu4Olt2vrZZP38bT9kYbvcZXkflVqX2oP2NR
         2Zchny5T6rI4fBA0mgHaZhqYxiapjz7xEV0a16UYPxXTMkN9nH8CvaOWUU/EyJzRui15
         mnBg==
X-Forwarded-Encrypted: i=1; AJvYcCWIWDENO82Fuq2Pbk6nGdjrU2hVv5LVZgPz/zzD0yvoys8lN2fbxC14WhY564HzEJQ97t0Pf9n+MrY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVf3bcBJMZmUjCZATK/vf2oHRP72VqnSrO8sTbAEeYFMerzZyU
	8hqtpp8/w+BradIZqL/9ikuLg2krexJdjUsr5uVOIs7yKRnq/5dpEBPPGYH5v3KH5q0UNBd+i5s
	JV5gUdtNJuSKAF8oOnOIsIsaD73nxU889ebf2utWzPA==
X-Gm-Gg: ASbGnctM4n7UIWCZlvL/l/ziCepuczb6lv0mjs25QHTm7VrjYsfZSOmoBXD3PAOSWzd
	e68RaCBKNuYN+hY9gYw36ZQR5HY5idHhb1x2zTP/fspLltGB6DOJjULhxYwTeErtrP6L+xlrIyS
	Qx5xyRUB8xc9QaGsbssdYl+z0/9KDQ1B+uE1hL3jxFenr5
X-Google-Smtp-Source: AGHT+IG+z1QRmX52XgvUvuibShCH4JxPGne+61lfX2+6MXnE61ffxBITvW1KTHFtHy3R5JyQX8kD9a85pxlYxun9pQI=
X-Received: by 2002:a05:6808:4fc7:b0:407:9a0a:3f54 with SMTP id
 5614622812f47-40d02a5655cmr8571934b6e.14.1751901049892; Mon, 07 Jul 2025
 08:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250704151254.100351-4-andrew.jones@linux.dev> <20250704151254.100351-5-andrew.jones@linux.dev>
In-Reply-To: <20250704151254.100351-5-andrew.jones@linux.dev>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 7 Jul 2025 08:10:39 -0700
X-Gm-Features: Ac12FXxjT-qZ8EUAqkDvvy6G3RYe4XxmKy5JhKeSLnukbAx50LvwhUxZI1axAGE
Message-ID: <CALSpo=ZU9Eb0E0cq1Um1t3bmbAt05K0q6e_PLpWAn0Oibd6hLQ@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH 1/2] arm/arm64: Ensure proper host arch
 with kvmtool
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	alexandru.elisei@arm.com, cleger@rivosinc.com, jamestiotio@gmail.com, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_081051_355684_E76C03CE 
X-CRM114-Status: GOOD (  13.50  )
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

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCA4OjEz4oCvQU0gQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9u
ZXNAbGludXguZGV2PiB3cm90ZToKPgo+IFdoZW4gcnVubmluZyBvbiBub24tYXJtIChlLmcuIGFu
IHg4NiBtYWNoaW5lKSBpZiB0aGUgZnJhbWV3b3JrIGlzCj4gY29uZmlndXJlZCB0byB1c2Uga3Zt
dG9vbCB0aGVuLCB1bmxpa2Ugd2l0aCBRRU1VLCBpdCBjYW4ndCB3b3JrLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2PgoKUmV2aWV3ZWQtYnk6
IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cgo+IC0tLQo+ICBhcm0vcnVuIHwgNSAr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJtL3J1biBiL2FybS9ydW4KPiBpbmRleCA5ZWU3OTVhZTQyNGMuLjg1ODMzM2ZjZTQ2NSAxMDA3
NTUKPiAtLS0gYS9hcm0vcnVuCj4gKysrIGIvYXJtL3J1bgo+IEBAIC05Nyw2ICs5NywxMSBAQCBm
dW5jdGlvbiBhcmNoX3J1bl9rdm10b29sKCkKPiAgewo+ICAgICAgICAgbG9jYWwgY29tbWFuZAo+
Cj4gKyAgICAgICBpZiBbICIkSE9TVCIgIT0gImFybSIgXSAmJiBbICIkSE9TVCIgIT0gImFhcmNo
NjQiIF07IHRoZW4KPiArICAgICAgICAgICAgICAgZWNobyAia3ZtdG9vbCByZXF1aXJlcyBLVk0g
YnV0IHRoZSBob3N0ICgnJEhPU1QnKSBpcyBub3QgYXJtIiA+JjIKPiArICAgICAgICAgICAgICAg
ZXhpdCAyCj4gKyAgICAgICBmaQo+ICsKPiAgICAgICAgIGt2bXRvb2w9JChzZWFyY2hfa3ZtdG9v
bF9iaW5hcnkpIHx8Cj4gICAgICAgICAgICAgICAgIGV4aXQgJD8KPgo+IC0tCj4gMi40OS4wCj4K
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
