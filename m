Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78073D3ABC2
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkfq6gR2zC6Q/qAOhdHj3F8FvM5epUyh2KCWdpjT+gw=; b=rGtQ8VnbiBk28b
	cVaVNleyM5X43WtxhpmiJ9kwyt1MGfywN4d+3Hh1tBORlRXSb6k3I3hleLdbbJWYsVp+HK6wyoMee
	HWvepY8mypns3yQGuPLSYe5NVwdiN4cSTiMrNgyXkeY9TG77WZemAXbIINAp/DsQlvkW8eYucv2yO
	K7/G8qIhNQ688TkDb77KtKwYz4NahSVfTRZPTM+F9FQCzJXtgbCGX1dP3g5VhK/5psJGTlUBgkkok
	s8PnvajAu18EvQdKwWE2nsWhl4qn87/Uzkz3qiBd6l59hwCmoLY/VH119xwXj36+B3kdfyAzuUHhZ
	3bX8Zs4e2lpO5l3HJO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2Z-0000000AK05-13yb;
	Sat, 06 Dec 2025 00:20:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0o-0000000AGPB-1jGk
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=56r/hH7ijnps8qr4K++rAycxqMKLQxyC6YFw0gfnCKk=; b=M8sriOp9e+7bbuiT1cKa8+FqMG
	yUahexaqzQqZ3julX50hEwfUyzVdj2ZK0/uIPUdK5dntWIbnhZpjWQyCZe7kSQjNzAj34J74Qb2IA
	h6sEkoxZQAVVyij2ZpCFMzIhbCaUy4RFnHR7k6vZOlBMix4rcJp34R/WSS+iVRmV6U0winXgrrc4m
	vDcLV+Fvi7fSC8pvHc2I84p8mY+/7WLmchdOn0JyB5/7NJ866dz8HvgmSo+Tft/D7Gz+KuxjO3S0d
	+q+yrBuS85luJhJM42sw+SXj/hlG5ZDDLGKz7w7t/9ELggoAewheA+uN3Ds5Wo8VYU2jO+pEtBReq
	7j3quyMA==;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRf9C-000000072rQ-0ohk
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 23:23:36 +0000
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so2996905b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980328; x=1765585128; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=56r/hH7ijnps8qr4K++rAycxqMKLQxyC6YFw0gfnCKk=;
        b=kLqGXm7X252kmz+3vLvEfXN0jaZsR7GH1nAvLD1KmF2TJIoN03iDUwYfDyFqd9Cqz0
         Zd95ynyfwv+QY4HlriV5OElDTv2NBPpMb9DPEwvlIQJ1yCEbe4LZH3lQqKYl4oQavP/l
         1RQV94JmDsKI9Io5nLvcfRxtcc6MUwrAv/llkGAxZGsb2f2PpPgggBUpE1WLyJR8YmP7
         J4B3flfdZfdmqb3ypoMy/kOIzYaQTVY4yIdhsqYSGYU6Pb60X07/lvx+RyX1+N97WsFw
         rPqruIkBYgweG5W3ew/R/vqQmd5bVXbGG2z1bB8T1++vGShCJ7hlvRhhVipsg0P3yqFh
         PKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980328; x=1765585128;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56r/hH7ijnps8qr4K++rAycxqMKLQxyC6YFw0gfnCKk=;
        b=j+SSUOULP2NJJgQftl2vh3ONRkbSx3h9HEp8tMIHntcvv7QY6rFbP2NQGRP3gZzU4L
         5JH6+fK7jcYk26rN4TtdWNlteFr3yqDcipFSV9MvVypTkW93kVLurmLScSSYu/J4gl7r
         oT3VY+Qt1i/dLC0dk4NiLpVOO04V+VEvDpx357MrveWgOoI2jQ6eVpqFdjLklY/h1ctF
         ZJdy7rP7WjGHGa/IpVlV0UuMH2ks/BtUEMoFTPOgK1v9XvBg8oEThZ0+1hJSUL/zHuF0
         Ybl0egprhiLisHsl9oLxot5lfkzDDwZoKV49I2gylP5cutwLGFLkDwSZw3Mkja7sNy/y
         oO+A==
X-Forwarded-Encrypted: i=1; AJvYcCUxqu5acpJyb6dBdf7v4H701Cgfhvu8zWa+kyX842yjbY8+cnuYuzrL8e92b/qTQVyhK3uZ7gNjyYs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ3mJ0Z//8ZElYMQYCiH2BH12xO2KrYSAFRpXI8EUAZrPHvDth
	vyMl/V72ux1xKFil6T4voSqE9+yQplN5G8B2iRuNxdA+DkB+SF14uXTZFMWV/ELEA758RzWwjy1
	XXWbziw==
X-Google-Smtp-Source: AGHT+IGLiFKCkiAoyo8w1adxKIx9TSOzM2AC83Bo64USM+supssaEydukBJfVufrwhWzLpi5mXFgs4LcC10=
X-Received: from pfbmy25-n2.prod.google.com ([2002:a05:6a00:6d59:20b0:7e5:4656:9d96])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d90:b0:7e8:4471:8ca
 with SMTP id d2e1a72fcca58-7e8c6dac0c1mr746508b3a.43.1764980327560; Fri, 05
 Dec 2025 16:18:47 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:16 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-41-seanjc@google.com>
Subject: [PATCH v6 40/44] KVM: VMX: Set MSR index auto-load entry if and only
 if entry is "new"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_232334_758514_98474828 
X-CRM114-Status: GOOD (  14.00  )
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

When adding an MSR to the auto-load lists, update the MSR index in the
list entry if and only if a new entry is being inserted, as 'i' can only
be non-negative if vmx_find_loadstore_msr_slot() found an entry with the
MSR's index.  Unnecessarily setting the index is benign, but it makes it
harder to see that updating the value is necessary even when an existing
entry for the MSR was found.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 2c50ebf4ff1b..be2a2580e8f1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1141,16 +1141,16 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 
 	if (i < 0) {
 		i = m->guest.nr++;
+		m->guest.val[i].index = msr;
 		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
 	}
-	m->guest.val[i].index = msr;
 	m->guest.val[i].value = guest_val;
 
 	if (j < 0) {
 		j = m->host.nr++;
+		m->host.val[j].index = msr;
 		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
 	}
-	m->host.val[j].index = msr;
 	m->host.val[j].value = host_val;
 }
 
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
