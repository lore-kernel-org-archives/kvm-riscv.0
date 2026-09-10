Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84B1C79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3a3gQcZZHuqE8tAHS5XGcATomJJXWL7avc11c57939M=; b=qrldK+CMvmz+Dz
	ePnN8UvO6KMGQHK60DyN0LsBEQX+Lbg6lexHCXQyUDJvxzi+znAcbm2mQyAMWAdOJJERfxNB9J0Vu
	nzjRGdjz3ocRHxM5U3svEugRXcvnxWE7ow/lbuEhDV8hOwrhOKxKUZD64Uhf2T9uE6S0ZSjptnHPI
	sfXL1/7CYwllmBMpn1QWqTLMiyLZJC5rFgEzWiqjP+lznxFO7abKEhtgUPVLD1rS+kw7t9kmJIvQQ
	U2xaY97UYoelWBIhwLvbZWbejKik/qhNQ2C7arZCI43xxjI029q/X5aPs3Y/pMbHpQIf9f39+eT8X
	GeduMBZ+Q3TON30xx6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVo-0000000E88q-1Yxs;
	Thu, 10 Sep 2026 11:00:12 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVk-0000000E84l-1X8k
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:00:10 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso329950a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038007; x=1789642807; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=U1Aw0CqQvxQGuc8x2nM+IKJ9zkzgfAhvCpwiO2BotjcoFUas+XPnIVzqIo0GS19PA8
         M70e+LRKUEvgiyQJdg+hpYci04UVMmVZ2GhvbfaB6QQZpDvYnEhadl+ElEE6jFelwOD/
         2Pb69B3VolBVHEuRBLzmWyCeAOHuUVL2vcLC782DxbEk31CgcGMSTmpFGDMDQv7UOiN2
         ANloE9Xjh3i7Dh1Cnt4w5gmpfKH1pPRH8ny8IcXGCtrlGqH5cWfoSV0DVHDt/QtKuZwu
         rm4YNqN/NdohxcBqLEusvox1OOHZeo+12liZr+A8TJbyAhQAxQ+1L9BAej2cZvNqTskD
         g24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038007; x=1789642807;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=eMsAEnD9LvDCLJm7Uz40bdJ/pPb1JEr+qU984cU0DM4K7TVs2hipxKQVmOrbFi1ZGw
         aB8A/PnFQg//TEgGS7PqDa7rqMTWswm1fiwzgmxMdrDre4HE1r/cFhndgFkjDyUIZmHc
         44E7gJAxehnohpo25sl2arbkBCTRTdh95CIwLinN/FS1PTP+8/lhsxgjdfoJEGRol0Nh
         tKcwnq6Vgtdj7ZOhOvCKK8ZTYYLh+me3yWqBr66Z09zlVKxAHwvPlXT+0HgkUquRrNI6
         mC946/jXAE42uYwPqlEUCC1LVtMeAONl7pZPLL0v/Lwzz7yUTYevj2f14x1LluXLLcWf
         QodA==
X-Forwarded-Encrypted: i=1; AKwUvBxYt/f21twlc+mVkuTi8SaIPI9SQgquy8fcheijCHoYSkV70n5+Kxgv0NV+brDU7EkqAdR2sQzG/yw=@lists.infradead.org
X-Gm-Message-State: AFuF++k3xo5uynxxDE5Dq20AS1EflBNN2Hu1nDhcEcKSGpX6qxrGSI1C
	ALwaMzYYUnaOyAWnAJ4PTaqTsTZVvZsuYZ3HB663PN2QODoZBPVaRYI+
X-Gm-Gg: AYBFou3ULBH9xz9A8uFkvY8UxfOgkzietxQYzijZ0nSDE8ARlyny98/WkSpemk3LWnH
	kyUS8qDO9kGfNHc0X1v6mCTX+14UO2VcluH8/pD2FbHYEViqScVGauWveE4bUF3I6gjc6uh2soK
	D7nNNQCb+UmMbonV7yfyokWPqq5riGwUYqhhDExj160y67tPAp1+JziF9HNpQNGBk1NQvW98VB/
	xktznV/M3gl3dyb5l0huBdz7+0sUMRmbTYrqiVXKU52d6uEmrppDgOtLxe/jg8XNpMjs/CWaLFi
	VYROgTU6MDpC5p6bs5ObM5QF/of70CW+a3uqpjxW3G8ErE8VjHSSWWF4ufUAn+wmpfM8lYnjXen
	Jmn7E4rG5qF4L0ojMKEQgWIpyjORlQT/IiZCia2an6lkwFGWB608LKNsUFx1R0p3MsxTaIuH5nf
	P9KAh8mSvZEBe6zUtcXu0qDN5YCk2bIZab80upyr1vZVNdUdWlGRtg97rH+wmTe1MSjgipVZ7QX
	QbgdK0h/WU8ZgPd0GG9Dk9mhW3Xi1DORVxYqGAlor+xPEYMzQVp5Lw=
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr58529054a91.21.1789038006053;
        Thu, 10 Sep 2026 04:00:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm46703778c88.13.2026.09.10.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:00:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:25:00 +0530
Message-ID: <bja51im3.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040008_584546_3203FD9D 
X-CRM114-Status: UNSURE (   6.24  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

Agreed with the reasoning. LGTM.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
