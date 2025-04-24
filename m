Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74806C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+ZOONTbV3e6RrR2mK3HpPOGRLmBXneKTDHuUdGgYaw=; b=I/BDrs8yETDKuX
	EgizZkxxcxiJf3oveoJZ3Pfm/qPSKHwQVl4Qs+tsQc7JDe9E5l9TzzRoWpM3DgDTfAKR4swneloj7
	ymhOps213GsrCwahA+/hscCkxKTiGXhfx9iENS53g6BVVnNGPIRhE+qgZrrZzkAcLJjJdAGi9j+O2
	bJbnMGVPaLcypbjeRbMkVgcq1nC1T0jiquDGURN7bnCcZV3HrGY05557/C7QmZZmh4C08URrBm4ur
	5WU9g86tJizG5jVI4MKe7i6514kkOMxmg39TE6JF5dnpVUYzMGF/fnLLH+kXcotxI6gzxHm4usWWe
	fBrukZlyp5mrlYXqbHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u807c-0000000Er5t-10BS;
	Thu, 24 Apr 2025 17:12:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xF7-0000000EJrm-1QmY
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 14:07:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso9388415e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745503676; x=1746108476; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0v6f9lKAMd35DpCsKVbL9D2wBml6curMV8py2v4cGU=;
        b=hdRuWbdw4c2DcMYLf+PXOIdqVKmLFo8VPftbpTbrtywiwH9pYNFL8QHUJ8I/dYjR+X
         9BOAK981ldNNPnSLViWtLdPajj3rWq76L7MFw6AkuY7jQUw/RXXWDqDu6dpY0//7Nvgc
         1SzNYcUjBe8wCTyi88m3tGMisNc5QPoS8mrCrrUXFeHS+CUvZrkix/9gWOuBoVCqJCWw
         96ElFYWbFhFqsUQccbm9YaKMvIoD4dmOjTr98n3gcA5A++Y1PaYDfl6x0fK6kQoJ6j9X
         ivCAdz+nr5lmkMW9WZ5LKJ6c4Rndpuj3+N4mN57eg0tuTLHMK7waKOmimYTdj9IQzAGa
         SaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503676; x=1746108476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0v6f9lKAMd35DpCsKVbL9D2wBml6curMV8py2v4cGU=;
        b=dQY8l8QGkYxFWkbraVNxkyxh1sssuGZI006+Jdz5yuT2iXi5NgJp+qeWTD/z1iBUZk
         epuHl6aH+NBdFsCtJYC5gAUIsEZlhKHsPyCPrnMnZ4luUx8K0ea4h5Ofaeb+DZd3CbVJ
         eAnqmyNOGn19kS7xzZVGmT+z54f/oyt6jceWkROL+IH7XMd3pgzLQVQx8QJLuF7ONqQI
         wfuILuf6/roJTBpg3KZbUe0huco9WZ0Bq68hjuqGXfvoN3mQnrXIxaca7kXQy2cWwlzj
         HvvG4zX1mbclaB9gLE36IdNtnG+Db73Xdvw9aJscVR9ySu7pGZNTnXlwtOeBUes7HIQQ
         1UQA==
X-Forwarded-Encrypted: i=1; AJvYcCVHx58FkGVlw+PX9jsshDQ3a63V06fEcCDi+GA4GvsgiKfNRzczDoFLIl5CjKCdZJdcxoflxzTYLVU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8jDG0DtXtdy54waKdFf1H+s/ExH7O9MAHMy/HBbwJQA6/FgmF
	uB/WuTd3nHeREmlO9Ybyir92DY1GXGu0uPLCvintQWSpwKJVNsUnY/tkWN+V0ZU=
X-Gm-Gg: ASbGnctAzVeJw7zCateCGUicfk+EH/2PWAnnAgmj8tJ3r4ndBubvuCCm38RaMiYNqLB
	rkmZvHj9X+gUL7xLFxiYJpKthf5ZER8Dw1hUHWAeZQEFYa8EsmV2RvV9YBIzq1quDQdMKm066nX
	TV3n6AfKQwT1T70TILzSkHOhz4AQNwVPln1ZDohqBEZZ2tFxfSYeWb9Kb55VP7FmEVQi7PSBzr+
	9NKv7/6MeHZJZvZss593oSf7CkiEYQQdtdZwY1JuHbmiH81lcUG3DTGRWc/epSTH9AKKVuGavqg
	z10ImWEY5q9wd1JGPxGY5iaBNzUYb6TnBICeS/c=
X-Google-Smtp-Source: AGHT+IFUPMtP/KjaYEN9MtbB/NYTf0ZhorBZP9X4u5pu7YG//9ef9TT7MFoljX3EChphPUpWA7o/8A==
X-Received: by 2002:a05:600c:a00d:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-4409bd18492mr27593225e9.12.1745503675515;
        Thu, 24 Apr 2025 07:07:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac27dsm22476585e9.22.2025.04.24.07.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:07:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:07:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, julien.thierry.kdev@gmail.com, 
	maz@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 10/10] riscv: Allow including extensions in the
 min CPU type using command-line
Message-ID: <20250424-153e6b09d5f0ccdee057a0d9@orel>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
 <20250326065644.73765-11-apatel@ventanamicro.com>
 <20250412-bc81866c2227ed98429f86b5@orel>
 <CAK9=C2UxikXyX_VEn7txnfXVjCdLE7Awn=yjs_Ye2dc8VP=DRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2UxikXyX_VEn7txnfXVjCdLE7Awn=yjs_Ye2dc8VP=DRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_070757_379451_0620A5B8 
X-CRM114-Status: GOOD (  12.59  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDc6MDI6MThQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBTYXQsIEFwciAxMiwgMjAyNSBhdCA3OjE14oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+ICBib29sIHJpc2N2X19pc2FfZXh0ZW5z
aW9uX2Rpc2FibGVkKHN0cnVjdCBrdm0gKmt2bSwgdW5zaWduZWQgbG9uZyBpc2FfZXh0X2lkKQo+
ID4gPiAgewo+ID4gPiAgICAgICBzdHJ1Y3QgaXNhX2V4dF9pbmZvICppbmZvID0gTlVMTDsKPiA+
ID4gQEAgLTEyOCwxNiArMTQyLDM5IEBAIGJvb2wgcmlzY3ZfX2lzYV9leHRlbnNpb25fZGlzYWJs
ZWQoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIGlzYV9leHRfaWQpCj4gPiA+ICBpbnQg
cmlzY3ZfX2NwdV90eXBlX3BhcnNlcihjb25zdCBzdHJ1Y3Qgb3B0aW9uICpvcHQsIGNvbnN0IGNo
YXIgKmFyZywgaW50IHVuc2V0KQo+ID4gPiAgewo+ID4gPiAgICAgICBzdHJ1Y3Qga3ZtICprdm0g
PSBvcHQtPnB0cjsKPiA+ID4gKyAgICAgY29uc3QgY2hhciAqc3RyLCAqbnN0cjsKPiA+ID4gKyAg
ICAgaW50IGxlbjsKPiA+ID4KPiA+ID4gLSAgICAgaWYgKChzdHJuY21wKGFyZywgIm1pbiIsIDMp
ICYmIHN0cm5jbXAoYXJnLCAibWF4IiwgMykpIHx8IHN0cmxlbihhcmcpICE9IDMpCj4gPiA+ICsg
ICAgIGlmICgoc3RybmNtcChhcmcsICJtaW4iLCAzKSB8fCBzdHJsZW4oYXJnKSA8IDMpICYmCj4g
Pgo+ID4gSWYgYXJnID09ICdtaW4nLCB0aGVuIGl0IGNhbid0IGJlIGxlc3MgdGhhbiAzIHNvIHRo
ZSAnfHwgc3RybGVuKGFyZykgPCAzJwo+ID4gaXMgZGVhZCBjb2RlLgo+ID4KPiA+ID4gKyAgICAg
ICAgIChzdHJuY21wKGFyZywgIm1heCIsIDMpIHx8IHN0cmxlbihhcmcpICE9IDMpKQo+ID4KPiA+
IEkgdGhpbmsgd2Ugd2FudAo+ID4KPiA+ICBpZiAoc3RybGVuKGFyZykgPCAzIHx8Cj4gPiAgICAg
IChzdHJsZW4oYXJnKSA9PSAzICYmIHN0cmNtcChhcmcsICJtaW4iKSAmJiBzdHJjbXAoYXJnLCAi
bWF4IikpIHx8Cj4gPiAgICAgIHN0cm5jbXAoYXJnLCAibWluIiwgMykpCj4gCj4gTm9wZSwgZm9y
IGNwdS10eXBlID0gIm1pbiIgdGhlIHN0cmxlbihhcmcpIGNhbiBiZSBncmVhdGVyIHRoYW4gMwo+
IGJlY2F1c2Ugb2YgY29tbWEgc2VwYXJhdGVkIGV4dGVuc2lvbnMgcHJvdmlkZWQgYXMgcGFydCBv
Zgo+IGNwdS10eXBlIHZhbHVlLgoKVGhhdCdzIHdoYXQgdGhlIGxhc3QgY29uZGl0aW9uICdzdHJu
Y21wKGFyZywgIm1pbiIsIDMpJyBvZiBteSBwcm9wb3NlZApjb21wb3VuZC1jb25kaXRpb24gaXMg
Y29uZmlybWluZy4gVGhhdCBjb25kaXRpb24gaXMgb25seSBjaGVja2VkIGZvcgpzdHJsZW4oYXJn
KSA+IDMuCgpUaGFua3MsCmRyZXcKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
