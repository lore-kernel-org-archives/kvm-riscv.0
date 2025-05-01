Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDF1C369DC
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 May 2025 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/g8dC0+cexHeGhaL5i8H0sEyEzeUIuOT9YFEFEoLT5w=; b=LjmezL5UcvkVEYnoKqgmM22QzJ
	QoJoDyk/8hy3P5PIXILMZNYv4QAAxu/i1Aau1rQwmJ6dmXkxtWU05aQqw2UES/KAdkaKeTPhfjORA
	bSXJdUvh9uDsyC4ZFPGfUNeQ6HvFi6nMqRY8fUJh8/EQwH4JgnnpPQNkH5W0OELBM0VFHxcGiGint
	4qZJGfbx/xM8wdn6cR9oS6fgCyaBdACGLKbtPuhusWZ8jT6ajwzJWfp6zRSNMozp0tGSQUtU7sBKb
	FffzO+Z8PFlxITYQd8uuH27oJWM+5DuOL8VrP/wRy2Gg74mpaX0ph1aFk3DsMyaNMtwp5sc26vvKe
	kVubw5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAcCo-0000000HW7I-41Ji;
	Thu, 01 May 2025 22:16:34 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAb4Q-0000000GqLc-1ION
	for kvm-riscv@lists.infradead.org;
	Thu, 01 May 2025 21:03:52 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3032ea03448so1350156a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 01 May 2025 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746133429; x=1746738229; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3LgD3RsHy0idAPG24WJvE7joJXrg8YFB/6s4D5IWPE=;
        b=uuUhXBgR0QLuqx8NstGWwshhtYlzqt0z9Ugj0S/dyDAyFPbCEpMjk1Xq07XU6hCHO1
         VnvzQ0wsqyj2N2aj37/L+lmswKLyXq2Vw03L4J1/f4fgjpm3R47er2zdEzFj4mehE6Yv
         0tsWd8DXT5WVRnbUUfAn1bxBcK8gBAg7e1IvsvIgHwiu0Pa09LDqTAQAbq0DJVzdqICm
         /cb+mWcxz/k44BanW90WTibYVuvVrVZD6AyRh0jtdSzKmMoOiOHA3+oJVaFQvpSmRUIF
         /45ZYAmrJ2HGMTem0vy4odQZqtifcCxlJ36t/Jwj4T/QaUIJ0fZCjT/I+sKYl71D691G
         GBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746133429; x=1746738229;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3LgD3RsHy0idAPG24WJvE7joJXrg8YFB/6s4D5IWPE=;
        b=pywVActLwMPyUkpwM8BXkB5fncXhWYUVrcWNTD4RV8Xt+D4mlUwmLBW0bc7UG6/SYB
         GcRL0lvBAfHDzfKtkHbmeFygfErY/pw36WoOPPC61VwUvAdj9EwkecfjEiuDg7TWksjv
         sxV+jr/q3b5MOVKrRs/eu/Qd90rPXJImeZuu6qYW9P7MMVY6FRPS8w/YCGZ7W2bGP2+I
         CFV1ktW9hhh9ug7mtd6gjfgsJk25m2+0sirnN+qHjChHSm6Hym9RsRyU1+dFK6hR4h9p
         Q5mRSh1w0mjU/WIVNV51XMDCiqLCTzqNRZqBsCfz+zBrVUQo1tap/ExtRAler/fAvoJF
         6IVA==
X-Forwarded-Encrypted: i=1; AJvYcCUB0xGA140CFrGW5dDtAMUsP/Jef76bnplaUn7LSV3aglRcEcw6d9rYsk8OiC0L0yK8wwD/x/k/pc8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeNthpIGJn1KSUsrzLmJrh4fLdtlnyT1hzuTsB1W+Pfc9+glVb
	2gK07T4OZFYTeHdI5m+yU9rZCNeuzpUtOlxvEs+hLZKiwKdHL3XGlJYLEn0soT1qLLye0jydhzr
	p8g==
X-Google-Smtp-Source: AGHT+IFsKbxWNYniktZ+08WA6b0CsvxaU/dos+kZKMRCn6iD7Ks6A9wZ87nfSSI8jfHEMe/wZJjzetRtCUk=
X-Received: from pjbnw14.prod.google.com ([2002:a17:90b:254e:b0:2ef:7af4:5e8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc2:b0:2ff:4f04:4266
 with SMTP id 98e67ed59e1d1-30a4e6949aemr658697a91.23.1746133428792; Thu, 01
 May 2025 14:03:48 -0700 (PDT)
Date: Thu, 1 May 2025 14:03:47 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
Message-ID: <aBPhs39MJz-rt_Ob@google.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_140350_341557_CD20D30D 
X-CRM114-Status: UNSURE (   8.43  )
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

On Thu, May 01, 2025, David Matlack wrote:
> This series renames types across all KVM selftests to more align with
> types used in the kernel:
> 
>   vm_vaddr_t -> gva_t
>   vm_paddr_t -> gpa_t

10000% on these.

>   uint64_t -> u64
>   uint32_t -> u32
>   uint16_t -> u16
>   uint8_t  -> u8
> 
>   int64_t -> s64
>   int32_t -> s32
>   int16_t -> s16
>   int8_t  -> s8

I'm definitely in favor of these renames.  I thought I was the only one that
tripped over the uintNN_t stuff; at this point, I've probably lost hours of my
life trying to type those things out.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
