Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5055BC28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 06:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhyeYBTxZ40H+K+lfftQ33wtyeuulJkVJxvB9YcxpTI=; b=Z1WRd7k/TRlLJt
	sjNBDpmQlflsJwFkurkwAIdJwCUdPaf1dDy6TY4hx4b+jdGvIuYEPYLmehwDSuaa0hXFQrfU5wdPF
	yrK4h+y4Js0wy1JPM8X3iPrIPRV5TANXok/c4wyoVdl+iczTSRMvkiZtq5z2aYD0NPNAz8IpKxynw
	4U7yPXwku3GkDqrencQPIUUXPczbbmIzRe1Dwhqm88O6CfT7ku6+/8kzkx10qLEfdq8AUhNtKRATF
	0LelaCWOexBUmS93fMdg2zJZ9tKWByyc0lV1HfBpIrWR3uAB6KruXTOSA7Bp+P1jRyl+DqU64Yp7h
	av00tky7N2YNnPYKzyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv9D9-0000000BI9e-44Wf;
	Thu, 20 Mar 2025 06:16:59 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv9D7-0000000BI9J-3yy1
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 06:16:59 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d46693a5e9so3868135ab.3
        for <kvm-riscv@lists.infradead.org>; Wed, 19 Mar 2025 23:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1742451417; x=1743056217; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OumWTE1YfFz2VvLMd8Qp/KkVHZxtkWOHY+KRV1KScms=;
        b=oDWwxttyzNl3SRPCOrIhS9HhL7fadU1ICgXYh8y/hbyH4DOjVWzaE4FGK8Az0k2YeO
         K/ebresWiBisQ+yJ6wgIaSLWyiU72mrFn7i/2UleC9ob8SbQ6a819cEFnRdfOgVRgQHt
         mwTph9+8TWy8Y4wwOCgYLYjFCxKng2V1pTsos7JHigBzu2FPXXpbJA4S8baK5TV24MmE
         saMowcNSHgJJqIgcjxqcECkQS09fyr5Mos91z7iMW00eNIX3SM5p7XF/G71LBxRJoYt+
         jlhjY+9LT/Qzc6Ugzvj+7lDiBQ0zS5GCFH4gay4+EoFNnW7SaCR6HcIwip45NBWTKlHj
         fb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742451417; x=1743056217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OumWTE1YfFz2VvLMd8Qp/KkVHZxtkWOHY+KRV1KScms=;
        b=GAeWAgS7Giqy9smJEsciPKQYudPVnvmjZmJ8gt0v3GvDaky/10mDXeihoAY8qH3djx
         qrIV04r3duy4It+O6z5/fRPrqVRrn3oLk5jvzn0OLxnv1hydqqeZqyas+vLJj4JlNVlL
         6DkaWsd6v+wJOZtHl6elEex8MOcChmE/eaAAkuhoim/9nU/jvKMioLbPWq6AtydT88vY
         3Gd/DxAqUGxbAaaNHNGK3GyBwiUkxMHY1Br2kSlsCfcBoAVeCVDD49BpntZw1FchHzEX
         VebPqf7cs8VRdaG+AZGow2z8UQvYfjM+wvQ2oPtIdsw1WVug+PRN3owhiWHPf/v+d21v
         BMpw==
X-Forwarded-Encrypted: i=1; AJvYcCVs8yPe6KZ9R26NJHbLYrhye5PlLfGfSMFu566UIK9EYIOlWo0SyU/ovvjZ2GqFuFzJNIk3zkKTRtI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ozC5TGJq+mmHGZkkCNBLzdXdyDHgegbhaTn5WcWajRrbYEbu
	7BcZS3q/oNfwhHEz1PkTKbUjNdswygZe6VejSfFlB8eZih2ulGuISWqHSgvTmDRjjWB2Cpfgt3V
	f9HOhPyv6QHxWZ3hVoNTVVPiAUrkVkQQ4ymMb0A==
X-Gm-Gg: ASbGncvMotnpZwCO/n2GZgWRrv8iTVxOS/xkzZZ/IwU9DLNYZDzF6dmYpM1XO9YjWs5
	DJ/wy0hmrBIckIFkiZ/IA3DLwZiVI6BGPf0k6O95Cb0EgydEDFvdTdGHa4x44s68bRM6J3nQmYb
	cWIbj7VmtCnkp0DIUdayyj/GQOLdw=
X-Google-Smtp-Source: AGHT+IHipmErTnY5JH+X1dtI8RojvvbQcWLsdi/XQW8CsQKWvuNjEAmBqXPOtO4Jae23WAgQHVx1Xbh9o0P7ZC58A0w=
X-Received: by 2002:a05:6e02:1d9c:b0:3d3:d074:b0d2 with SMTP id
 e9e14a558f8ab-3d586b14fcamr55445275ab.2.1742451416731; Wed, 19 Mar 2025
 23:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250221025929.31678-1-duchao@eswincomputing.com>
In-Reply-To: <20250221025929.31678-1-duchao@eswincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 20 Mar 2025 11:46:45 +0530
X-Gm-Features: AQ5f1Jp8ck1csnU-BaM6TvZZs8RKPQqg6ZKhFpmtTukK9VGozPJ4dYYmH7prrsQ
Message-ID: <CAAhSdy0iyb0PfUbuaDMi+QXF7LRoL2i=hHSe7deLyia3rmFcyQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Optimize comments in kvm_riscv_vcpu_isa_disable_allowed
To: Chao Du <duchao@eswincomputing.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_231657_991202_C07C1A8A 
X-CRM114-Status: GOOD (  16.80  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgODoyOeKAr0FNIENoYW8gRHUgPGR1Y2hhb0Blc3dpbmNv
bXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gVGhlIGNvbW1lbnRzIGZvciBFWFRfU1ZBREUgYXJlIGEg
Yml0IGNvbmZ1c2luZy4gT3B0aW1pemUgaXQgdG8gbWFrZSBpdAo+IG1vcmUgY2xlYXIuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBDaGFvIER1IDxkdWNoYW9AZXN3aW5jb21wdXRpbmcuY29tPgoKUXVldWVk
IHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTUuCkkgaGF2ZSB0YWtlbiBjYXJlIG9mIERyZXcncyBj
b21tZW50LgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVy
ZWcuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiBpbmRleCBmNmQyN2I1OWM2NDEuLjQzZWU4ZTMzYmEy
MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IEBAIC0yMDMsNyArMjAzLDcgQEAgc3RhdGljIGJv
b2wga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4dCkK
PiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZBREU6Cj4gICAgICAgICAgICAgICAg
IC8qCj4gICAgICAgICAgICAgICAgICAqIFRoZSBoZW52Y2ZnLkFEVUUgaXMgcmVhZC1vbmx5IHpl
cm8gaWYgbWVudmNmZy5BRFVFIGlzIHplcm8uCj4gLSAgICAgICAgICAgICAgICAqIFN2YWRlIGlz
IG5vdCBhbGxvd2VkIHRvIGRpc2FibGUgd2hlbiB0aGUgcGxhdGZvcm0gdXNlIFN2YWRlLgo+ICsg
ICAgICAgICAgICAgICAgKiBTdmFkZSBjYW4ndCBiZSBkaXNhYmxlZCB1bmxlc3Mgd2Ugc3VwcG9y
dCBTdmFkdS4KPiAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgIHJldHVybiBh
cmNoX2hhc19od19wdGVfeW91bmcoKTsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gLS0KPiAyLjM0LjEK
PgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
