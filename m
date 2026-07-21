Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89B5C4452B
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 23:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YIK2DXj7+rFPj2nALxH2UYt2+gBBFpPQrJ6gO8cBSRA=; b=nhFjXTajg+EOHm
	sMAVx1HobBdjpypnTPRtNdelkWTPS57BYV76A4Piher5CGL/wBCICd+zNjg1RPXWIm8nwWWPAMPU1
	ftDih+rZwPMcA/fykrL6M7aAuP/Ve6GIov/R+9PsKXfQbieoCmfkTZAYMKBCDzujKkMGadR9ZnC1n
	MSfPD1HPba7YYo+VNL3f1OeBzzVokZWe2YJ4P1jZYcgBL/QDNUNqQ3A6paEFJ6x3qrh1X+WkoQ6Fs
	WuIqJy+ZuoeOfzG7j/6VhACpgLYffTfLo93fYc6WOt4JFqkgllrZkujBRw2hURnuIukb7ppeqoG2/
	HvWdGf3OH5CrXo8u9DtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJYo-0000000AYCn-0JnA;
	Tue, 21 Jul 2026 23:07:38 +0000
Received: from mail-oi1-x245.google.com ([2607:f8b0:4864:20::245])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJYk-0000000AYCS-3yML
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 23:07:37 +0000
Received: by mail-oi1-x245.google.com with SMTP id 5614622812f47-49226201eb8so11347931b6e.1
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Jul 2026 16:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784675253; x=1785280053; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXklq3z1zPJM73DGXfVs9Rwe/LHFVQt6fqyhM9xa818=;
        b=al6rDsuHfvBzkjTSF0Wq4/dz2tNqGVAVvVQRpoAYNbfeT8Lddkea7YL5Yvn8LI9GeN
         GRDBTPjOoPYkv5SuLk39f6JL4MkIOdl4ei9lE+bghhiasR7aD9qn3QRYSQ3706vK/k5b
         d5kD9NdQAKlexXI3FhRBIhk4Ta1REunh4yD6+qP7sI9cq4l4+j2l7OAKPc5ztG+B2sM5
         ZHylERNcCxLBfBcW/vqX6kWvKzJAMJ9Fd0kiP0DR5hfFTx76Usc4nYNrQBKs0lVJI9Fa
         GciJzh+lDrfY44DgXE75GqagxEdmbizwaBLChbEuKhffNRMwG+8a4VQF4JbBcgKOsi5A
         dCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675253; x=1785280053;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXklq3z1zPJM73DGXfVs9Rwe/LHFVQt6fqyhM9xa818=;
        b=WVVTMW2pGUvgbDtG4SwrySpS+BFm4SEr0vhH5eAqDy3NJF1dVgdo+gqcmImlikwP7m
         8eZOLRS20VfzUnz+NFifhab04agDU4+EXiOj/OsjGIA2sygmhKtWObssbJ+r9wiDRY5x
         75fCovYircA+TC4228NQxtjk914IOmamFLrrN+e4vFmovakhsTbauXT+KNRH8a+lFdSO
         DWeOfJoZ23EbUUpVQeaX29slArCov+XGo8TJa+9dgiZGMKZMcxjuWSM3V8D9F13w03zt
         jAmOh1NNQHD+TGTAbAYlYuVJKhwviePqPS/Hx93Xz/ZtNzaPqN155Krtsi2VfQsi4VtK
         iC+g==
X-Forwarded-Encrypted: i=1; AHgh+RqRaUzUWO23arxgBJZKLaN1qw6PPTCpkbvgAn7IO5M64lMvCn8rPDzwehUseRtYCq5cEo4YF8uzOjA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyoZPUN8NKpFxOKdFQg+Y96fk37M32iIOWp1sAvD3oC1OqS/tR2
	/uRXDVDbNtoWz5VWerx8xYLbL4myw4UolkqVgbe4AFJ2e/SEL9xr9+vTtvQoPSQTL2PkeBLbYy3
	YFkchhiKT5qI8WdbdjaUUhUULJA==
X-Received: from ilnt5.prod.google.com ([2002:a92:dc05:0:b0:503:9301:3c0f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:15a7:b0:4a4:25b4:a0be with SMTP id 5614622812f47-4a4d0344556mr13073948b6e.2.1784675253077;
 Tue, 21 Jul 2026 16:07:33 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:07:32 +0000
In-Reply-To: <lxhagolfvr6w5h5xujrhq33pzx7hb6db5ihga46z6qn3dba4nx@q5b2fdclitqs>
 (message from Andrew Jones on Tue, 21 Jul 2026 10:58:08 +0200)
Mime-Version: 1.0
Message-ID: <gsnt5x2854cr.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [kvm-unit-tests PATCH] Makefile: efi: preserve .dynstr section
 for LLVM objcopy compatibility
From: Colton Lewis <coltonlewis@google.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_160735_008684_46D94BC7 
X-CRM114-Status: UNSURE (   8.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Thanks Andrew!

Andrew Jones <andrew.jones@linux.dev> writes:

> On Thu, Jul 16, 2026 at 05:33:15PM +0000, Colton Lewis wrote:
>> When building EFI binaries with llvm-objcopy, keeping sections with
>> '-j .dynamic -j .dynsym' without '-j .dynstr' fails with:

>>    llvm-objcopy: error: 'arm/spinlock-test.so': section '.dynstr'
>>    cannot be removed because it is referenced by the section '.dynamic'

>> Include '.dynstr' in the list of preserved sections across
>> arm/Makefile.common, riscv/Makefile, and x86/Makefile.common so that
>> EFI binaries can be built cleanly using llvm-objcopy.

>> Assisted-by: Gemini:gemini-next
>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arm/Makefile.common | 2 +-
>>   riscv/Makefile      | 2 +-
>>   x86/Makefile.common | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)


> Pushed.

> Thanks,
> drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
