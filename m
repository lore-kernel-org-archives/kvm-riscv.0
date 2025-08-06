Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472F6C87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhqN7F3omRZqy0p8rSnnPX1w+Jgo5W+iFs8zJFefZek=; b=eQrXfDVKa2xf5p
	ac8ZO7fDmCbgJcs6ftcA2nB/vMN+o09MJRaDlohMR85m6ZE8aDvoJSZKGWjVkUXZ6n0J7v/L6TX5p
	heVMbCe/6blBkwtvH/tmBJ2Ly1W0/XUwrYPiKzrQAA18h7s41FFhvzGMhH3kKQTg2Yl70ivbFOHRw
	dSwrDBKCczpO+75MIvMs+vU90s9PzVIhxNBB7C5wSyLUKHfaFotysmXXpGpe7NeydTUuGKMgjF9YU
	WBX3zJ1Rs0iwktFIAJngsnuzWxyclfZdlOtNbv6EvFwYIeveMBCArMYiI/w8819BG0h1t3bo7R59r
	l0H8DgzaYwgL+7+XjBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkiu-0000000GOiX-3eWr;
	Wed, 06 Aug 2025 20:26:56 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGh-0000000GGHJ-3oXz
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:49 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31f322718faso241165a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510267; x=1755115067; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=V6GitVs58LgSs5T9j7jt8hclUfm0doY6DCHFmJ55L1k=;
        b=jT8M4FuFrhL/Hwk2/iSrfLDWay+Pj18agC5aGdyxvh1aJevHXpqFtODMQTZPrPO30i
         cWKvwOFFrneeMwWgRJ6cKNGRqzjxbabCLsMnbQbP/wkl3R0AMaOOnbchJe2wU5k8Kbbr
         0xEFy/vMUCbW3V0HApO6HGoglZSZv9zewgbUKrg9rGc2o+wBhq5TdSGMHIBrzAzJFhNM
         JCFAj4s/s4bjHCyz8nQslVAdfkUZOyGHbfe3YZMG/seeC1MSUdiDxRl4t9cZ1iAWS/pz
         Lb6wtO21dqjosfCP2zOb/2pblQC7VDSJbaHmLrNbjp8UsY5CZUfB+YPx3l1xP5n5aEbD
         B7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510267; x=1755115067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6GitVs58LgSs5T9j7jt8hclUfm0doY6DCHFmJ55L1k=;
        b=VDDRbOdRXpdXRHf1c6pDwbN0EdPYupBWwdurY/WlKjr+0sIOaFuEMg2CEejxvdWgBJ
         qa7StF+pK5EBOOP4cAwsy2Vx/dehmH+ho2xzdtJZZM1VQsntX8BQaVycmZwWPIjvRyei
         amyOSwsVZ1AhFcREpuw63E/AWnbBdlmr3XA1FUf5vNxcN97Qfh4IjSt081T1OIBjUkVv
         2MznNuHlSsPGR69aYwPYhmVsnJM850WWJiV2uLS6GnRUMUmRJB63Ca0B+a2TgUjFS/m+
         Ghvh7Q/oYV+kNaWaCmI4c7x7TdwRNZiFQe7LmCEYNKqvz3Ldeu8K0Bdah9SKrkb05pXC
         6Lug==
X-Forwarded-Encrypted: i=1; AJvYcCXZv4tzpFCypnlOZrGawAhx6Gxzx4pWliyTdeaIFvK8VQ3lfnWIo1vVJnj8tW320GCtsXC6vX1Tp+w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0q8LCuIRJxJvgNIQl+HyM6o4od0fxFcUdh+Vxfp8v/5C2b1Pq
	WheYnV6T/HaIrzz9TVcQv/JQMkieN+QZ9eNFWLnfARgofo8A6MeT0rDTIEC0XzmhgJJHUbIflge
	pN18WOQ==
X-Google-Smtp-Source: AGHT+IEe9aouosNHmFsjzcywZl+bDxrMa7gzbIrywT1O9OJ/U5YazLpsqSIEAJkZctqsm307cXJuaDMPuPY=
X-Received: from pjbee13.prod.google.com ([2002:a17:90a:fc4d:b0:311:462d:cb60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2743:b0:311:fde5:c4be
 with SMTP id 98e67ed59e1d1-32166d06ed8mr5169966a91.35.1754510266366; Wed, 06
 Aug 2025 12:57:46 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:32 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-11-seanjc@google.com>
Subject: [PATCH v5 10/44] perf/x86/core: Do not set bit width for unavailable counters
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125747_989191_EC848A67 
X-CRM114-Status: GOOD (  12.50  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Sandipan Das <sandipan.das@amd.com>

Not all x86 processors have fixed counters. It may also be the case that
a processor has only fixed counters and no general-purpose counters. Set
the bit widths corresponding to each counter type only if such counters
are available.

Fixes: b3d9468a8bd2 ("perf, x86: Expose perf capability to other modules")
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 9b0525b252f1..b8583a6962f1 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -3125,8 +3125,8 @@ void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
 	cap->version		= x86_pmu.version;
 	cap->num_counters_gp	= x86_pmu_num_counters(NULL);
 	cap->num_counters_fixed	= x86_pmu_num_counters_fixed(NULL);
-	cap->bit_width_gp	= x86_pmu.cntval_bits;
-	cap->bit_width_fixed	= x86_pmu.cntval_bits;
+	cap->bit_width_gp	= cap->num_counters_gp ? x86_pmu.cntval_bits : 0;
+	cap->bit_width_fixed	= cap->num_counters_fixed ? x86_pmu.cntval_bits : 0;
 	cap->events_mask	= (unsigned int)x86_pmu.events_maskl;
 	cap->events_mask_len	= x86_pmu.events_mask_len;
 	cap->pebs_ept		= x86_pmu.pebs_ept;
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
