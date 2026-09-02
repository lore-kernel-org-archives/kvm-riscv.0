Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB84C624D3
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 18:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxvyyPtVgjSM2c9NC5FIqtsgMyeKOQA6uQtxgBLWM/A=; b=yi+RaTgUXvNCRU
	ywDq2W8cjdCzSJ1IRUwIDFGk7yCWJMOzMEyeE5xRdh8wadXlRqBUdrIpnyd37FdgMt5IDTUILBNhA
	LC3itCF6nLzQOxCxl3YnmTeNeIqoAG1hTeJIPpodxlKX1G+E336J+VGjlmyXH6Rn8j4crBHoNmnW4
	vBStr1eYkB8A4yR/FGVYeqO5T0xngIchrmFJnN9pGAZG86dpAA67NXGGYjGYoopaJrW/QkRJCcbKx
	GESrY1SnYrz3mjhXmcbApiu9ywTBEXYyFlG3oojO6UFWRPzZeXlHuzGut8PVRKwu5XrbGWQBCTYaK
	XdBdRuRuoYFZ6Cum2/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pKu-0000000FXWO-3Xej;
	Wed, 02 Sep 2026 18:05:24 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pKs-0000000FXV8-33SZ
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 18:05:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1313695a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372321; x=1788977121; darn=lists.infradead.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=PuCaPRW/QVNgvt3V4HGNaA40SBkfx0hCDEI0+0BIbtZiGO74GfNMJyks9mLSHYMJD6
         u2LJJzGUT9Ia+t4HUUuNTyu/LOMHrdbarAcLqPmQ7CGLePigFbjywd+tHJ+HUP2sZDzM
         AoI/ZIy42MP/Z4UgOPre/XJvo/s3DSfSxJ13vbBliXDnudGUTf7xftVwZDNCGCfuOrQl
         MmpSMnF2bnTXw5bsL1Lf74naqrJVcwOiPYehbsCT56bvcxogZlyMyw/2/xO8SU/89nHv
         MO/I8R92XrVdSHh7lcHfemTfpzlJopDkWMVQ3lKt7FCZtX7h+eeWJumGWuqveqohMbyP
         tfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372321; x=1788977121;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=R5f5RtFJVvgL5jZDj2gQhna6XHkDeNlGDX+RcBL15TeSDeibP03W2zxUohZPkibY2b
         aT8iO4H859/h362DJl5P5UsEm7YgAY/w2NXOpZafCfW13OofR7yJsVNLCrKXD74GlsTC
         9OyqrpOxgjz4GfNIDFJ1auONkAApHesiYzExtmCwKYa8joLVYL7qP+I41SqYFSry9EgW
         uZAubyu3yM3c7D3j5rTXmBe0pgAaVt/QG3cyP9v2zwsolovCWy1oO9yJDjMY8Kn90IDJ
         ndffpfK6ZmH34Hf2M1SQHWC1k3p4LJ+iI+v0IP/89NQKcdcvk3H2lNQ42BvmUUSyqCkM
         9Scw==
X-Forwarded-Encrypted: i=1; AKwUvByW0CqDqaPzO/FpHkPcK+K3dxfAQKhRWKQTZb2D4FhvWqoo2+TeNfLxkHc3Nx32lA1odjQ4AIcayiE=@lists.infradead.org
X-Gm-Message-State: AFuF++lQZPY7u1EOFSoWxMnv38lFZwmqvffaAV5Ja1TTqejylMnVhruL
	1d7tOEH9RLwiP50RQtUNAI54RbESs6y8Wiw5mKG9p/16vrqiARozo7qb
X-Gm-Gg: AYBFou1rSqGI9deQNZb3WSMD4+5o9gaZgS4+a4S1J6bBbY5AZKxhStlOP+kvjzECCw4
	YgKE3m9NMNwUA8IZlVukHQu8xTJn/ykFN6BjEB6gxMi9bq6jimbDlIsy+1aZVj8ADUtbN9/8bdn
	c927aAfiP1qEjL39FRidWFBw+rGflp4DBbvKPYboHUwknYMRScc8S7e7h8f2qRnH3z4R10NEbNg
	S8PuD1xxZf84B01Bm1cZUokySyyKTmjnhvbLYjx7qcSSABU67fT50kF+Su8AQvfXEA4X0UImPA4
	bPUZK7ROsEWhADSSfklJ+PESM667VHmGx8/1hCb8sHcDgcZVEgyi+gXEUddqsZ+ofvCqh6ihRIh
	DKZ+45gPBPRZgveq7kNPi4RqSqKAkqh1PBmPz7IbLIACh2y3Ed+GKp9rCFc3/qCRbHW8UvX98K4
	INLAEJqaDtJjEFuQ5CRW8HFmRNsi3ONCQccqtnZIrPEkVN8ZRpF7IkB0gyKoK/Hu8W/qgqw8PYK
	DSGlURy1PITbwdQsrhhE4dvl+/4l3WIyBTz7cXiAEyj
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr9138561a91.18.1788372321290;
        Wed, 02 Sep 2026 11:05:21 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm9808273eec.18.2026.09.02.11.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:05:20 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
In-Reply-To: <aphioo_KTboUCtZd@google.com>
Date: Wed, 02 Sep 2026 23:29:06 +0530
Message-ID: <h5k7ttzp.ritesh.list@gmail.com>
References: <20260826230511.972824-1-seanjc@google.com> <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local> <aphioo_KTboUCtZd@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_110522_761453_F0854F75 
X-CRM114-Status: UNSURE (   7.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Sep 02, 2026, Gautam Menghani wrote:
>> 
>> + linuxppc-dev
>
> Ah, shoot, I *just* posted v2.  I'll add linuxppc-dev to that cover letter.
>
> https://lore.kernel.org/all/20260902164123.2546762-1-seanjc@google.com

Thanks Sean for sharing these changes.

Thought of sharing an interim update:
I have rebased PPC KVM selftests support on top of this series and the
initial tests ran fine. I am currently looking info few findings though
- but will soon rebase those changes on top of your v2, review that &
update the results.


-ritesh


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
