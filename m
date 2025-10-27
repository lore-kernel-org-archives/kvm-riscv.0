Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332C2CCF9E5
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 03:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8GngBVVIogWUT6dYrwi69UMqcpTuhnXJhIgWeJpSyk=; b=ErYCHCVVmVHz9V
	cERRgC7XBwT8zzux+Kym7EgZu9WL3yog8GQ1LAfuWl6mq/UJ4avYeYoY0JEzmiaaDsQR+Oq2q8gSN
	yTmCZTBzaUzk165wkfwXXih3p7kZwkM/YZWh3oRMmxy+eIbYD/nhwGSVq4ZVVVB/fColWfY3QIFRr
	2/IQ0Cv6e5gnIuhEi0AW4VZor3mBHxIuwk2sPJFLUr0FkKbA8yVHk9M0XGzZ99KcP4GXDJZyIlXKl
	rce0doPBVc8kgmFm+CYDc+MhVHO949TZ0GfFdRccAh8REfH2rqZIPsmCnLtAjBte36O932hn5LKa7
	HfLuqYKOrCGevmeAvZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDE43-0000000D42Z-28jt;
	Mon, 27 Oct 2025 03:38:35 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDE40-0000000D41m-1xSg
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 03:38:33 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-945a5a42f1eso38597939f.0
        for <kvm-riscv@lists.infradead.org>; Sun, 26 Oct 2025 20:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761536311; x=1762141111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLv/abQqhTrjCuxnsZKW6XWrZqaImCMO0bBeDuN7Ur0=;
        b=LhyKsfu3HuYWGgRogHX8HrmAgJVAFN6K0aQ3HHM/yTdW5b2e5gpzDrRD/Ig54yXI8S
         CypLEwoTeZDFdN/x0DtPNf2matMMPY9x1YhvaRzOvUKIUtPU26lk/1vj3ydAFiQnCJeY
         ZXHdO7pT2yC4q2bZNcXrm0Yugz+/TI4OdzlZX/wA/Qe+K99wIIe7trK2Fqax/ghN+wiP
         HE4MncIdTaTel1qTczzdUHoGUTW5QgL6kPVesEDbp7otCvb4feyIH2MWKbZaOQZ9K0bG
         esmymQl0koH7lFlKFZj0UjHYEZleYRwImyqRClFaOUZv+JeMtO6TVbMJZNql7C4iIpvM
         bRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761536311; x=1762141111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLv/abQqhTrjCuxnsZKW6XWrZqaImCMO0bBeDuN7Ur0=;
        b=FDaaj2aIujHK+pjbm4QEH/UI516jaxXGRoZsqmiPqjnmE+eVXG/cIQMWQmwZbt0MtB
         nZAuikI/hPobJyS/USt46eTM8Yyq5RLVqF38zJqKPrqCXYgvsEMVfcuNnsl9zN7Fp7yq
         3mz0Ax1HJrD938Z/2r8KMdjM9Uhj/FuGXiFLprj5BIoajlicWcd970URY0DsD3dl456I
         FkcyTJomHXIa/V9ZiT8bUJey9JyJCQe1GisWdO64r6P/AC+k/6NDgjZ0WgK9rQ+ouLBe
         AvRyywP4xr1BcnzccebRoD9gAfvAoe/yAyw3eqShpuBMFJziQMAWihOsInaYcf70SZqf
         XAAA==
X-Forwarded-Encrypted: i=1; AJvYcCWbzbdQ1EDqB3/rv3vNU+yrwkZXjTDcUyfP0Qzx5x2VgR1yYZRnDjdmRZybxxYkXk6UVi/BFCoVpig=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZiOiTO4JcksgAo0RIbJnT2nk6IN4uMcixalsqO0HoD23BMx43
	j74fZb82xsXC8foq1IOTx02j0BJAMdNxc2pHFyD5sxsfCi2/6/D+63G7vqlrdkUAxt1tW33zTCC
	VQAY1baPOAgLzQowbOuFIGk0Rjr9kLlzo3D220Iunh0Tr7hZFM60PuoE=
X-Gm-Gg: ASbGncsczPLFIeydYyXvn7T3xOIHEsH7FCZDvHPF9lMMKcAQ6f2DneuU9Dmrdpr9c9p
	LWKlj7BTsYTbqz5HSkIiXvyveiqNBZHvD2Di/3QpZlZtP+LaBzo4SlSrxRwwKl5MqPceyjLohpN
	n6Jq8tzHedI308o2t+qtLvHcu12SIhtF8h5M2Q736zCVPZCtTMQAf2qlOu8q2JLCyCqtrVbK/Te
	dYsSpUSxY6+NA613NBKaIVvLjbol7z5ivlQQrL1M7R+T4jyPFR/OE1SIreEeJj76rWhy3uu4Ng1
	2oQ9S0GoLCzqSYGiVPNWQZdwM1uXL3o1l4Jtsp85bEynAwMb+UWAR4zO/JlW
X-Google-Smtp-Source: AGHT+IFXk1YUaLAdhvo8rgPkIKe5gLo/c+djIhEIA40LWqKcizzRXoBKOFj4cyggO2AuZkgxTRXbB8jToGSbWYc3oMw=
X-Received: by 2002:a05:6e02:190c:b0:42f:9eb7:759b with SMTP id
 e9e14a558f8ab-430c5306894mr466704455ab.28.1761536310727; Sun, 26 Oct 2025
 20:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251017155925.361560-1-apatel@ventanamicro.com>
In-Reply-To: <20251017155925.361560-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Oct 2025 09:08:19 +0530
X-Gm-Features: AWmQ_bleYZ_iePePDvRC5d6Pe5JA_nbAbhQUpFmow4pTKUmpRz54E4-TMp1PLS4
Message-ID: <CAAhSdy1+AFQepjrfKrcQvC8cxDpjOHfF500O6FXTYzf-iksCfw@mail.gmail.com>
Subject: Re: [PATCH 0/4] SBI MPXY support for KVM Guest
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_203832_740776_ACA23A61 
X-CRM114-Status: GOOD (  12.08  )
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgOToyOeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgU0JJIE1QWFkgc3VwcG9y
dCBmb3IgS1ZNIEd1ZXN0L1ZNIHdoaWNoIHdpbGwKPiBlbmFibGUgUUVNVS1LVk0gb3IgS1ZNVE9P
TCB0byBlbXVsYXRlIFJQTUkgTVBYWSBjaGFubmVscyBmb3IgdGhlCj4gR3Vlc3QvVk0uCj4KPiBU
aGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJlIGZvdW5kIGluIHJpc2N2X2t2bV9zYmlfbXB4eV92MSBi
cmFuY2gKPiBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXguZ2l0Cj4KPiBBbnVw
IFBhdGVsICg0KToKPiAgIFJJU0MtVjogS1ZNOiBDb252ZXJ0IGt2bV9yaXNjdl92Y3B1X3NiaV9m
b3J3YXJkKCkgaW50byBleHRlbnNpb24KPiAgICAgaGFuZGxlcgo+ICAgUklTQy1WOiBLVk06IEFk
ZCBzZXBhcmF0ZSBzb3VyY2UgZm9yIGZvcndhcmRlZCBTQkkgZXh0ZW5zaW9ucwo+ICAgUklTQy1W
OiBLVk06IEFkZCBTQkkgTVBYWSBleHRlbnNpb24gc3VwcG9ydCBmb3IgR3Vlc3QKPiAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFNCSSBNUFhZIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QK
Pgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oICAgICAgICAgfCAgNSAr
Ky0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgIHwgIDEg
Kwo+ICBhcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgICAgICAgICB8IDEwICsr
KysrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9iYXNlLmMgICAgICAgICAgICAgICAgfCAy
OCArLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5jICAg
ICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV9yZXBsYWNlLmMgICAgICAgICAgICAgfCAzMiAtLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYyAgICAgICAgICAgICAgfCAgNCArLS0KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfdjAxLmMgICAgICAgICAgICAgICAgIHwgIDMgKy0KPiAgLi4u
L3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgIDQgKysrCj4gIDEw
IGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5jCj4KClF1ZXVl
ZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xOQoKVGhhbmtzLApBbnVwCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
