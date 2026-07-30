Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18621C531D0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z997sXU3sKFtFPVOA8o3f93DD9cYiZp08zWCQ+khjC0=; b=o2gqW/Zv7V4Hvm
	7DNWOtq3N2anHkIodeme/NJjTr1GmhVrBRaur53IlBJyWR4qoxz0EzxuhlxrjO4WoNO0zZDDsYRK1
	8atSqzPGW2g/tD4nISyevgwSvs47mZIbAfM5KG45tvRW4hMOddP8fl3vCS2LZ/OgswzRzgfjwUU16
	NCchKdF6N1Kbu9V1P5GFwJUPryjUbytYg8c2zRUEiKNOG5UchfKbYtMzTGQbyNuuQw28q5yHJg13z
	qd3kXbIZAAhtjI0iqV9Wmc8U/KPmcGa1hk0mmGZ0fqDamkgn1nnvyfeA02syWiHE8uYFdfpQNmvsV
	3aLdqxCB/vizs9spKIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKcH-00000009eOO-388h;
	Thu, 30 Jul 2026 06:51:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKcE-00000009eMT-3xkb
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:51:40 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cea3004256so20741655ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785394298; x=1785999098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icMXTnzaSJ6+MSeJ5Apat14mapNo5PQAIFNRe+YMLec=;
        b=l0Pcl6JGw0vBDyNXKCv82lvzU/Nx2XGGljRk5bWuWMPS+Bb+L3+G+En227dCUNQmHd
         2KeSPR67cPYWgdn9DQ6+2vz0JAhFlh3/h6O+3ZBU1M3tmpdF/aRzyw4+B1JTeZejwBTV
         /wW98UUAQc+d+QMtN7t1owYxyF1ch5xXcOA2GNAKARdxew7ybXgcaBu6Oq8JUVSEgG9j
         bLQF8+tTHW5dhtMdnoL5X8GCxAklwi5riKVuSJUuCEfYeUFua/yNqY16iMMk0HdQv0gb
         s/WuNB1L9o55QSwTyPxXQhJ14NhPItzc5HbQ1hjOw08EYae8f7zVGkl1zbGAnX/toDVg
         e35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785394298; x=1785999098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icMXTnzaSJ6+MSeJ5Apat14mapNo5PQAIFNRe+YMLec=;
        b=lwnoASBF57qZQ5p6kKjFr0YUxGl1N47o/Kg6OqbRMm5mOnK5Fza5SS8LWLG4DWLOm/
         oShCoH2zgwQ4Kh1zLZ6YIITws+A4K/59/Us6PPnKfFPrCW/IgzHdpwkiX62AvRAFdT9V
         dO/srJVNCA0G24fTKvNM1C6bwDiThNwyeHCm5Bc8ZL4cdACW2vgWliSgoWLBRXr0pW/c
         nmFe9eqCTAnK/UZmbPWTAf84NjyVb0LHftoeC/nZG8z2sW3ZAuxMVKABfun22TYXcxf2
         D/EDs/VGz/Oo5h7ZiNF8s7ljwG+V2ohqn+yqjm1eWTDAXMtr999Qc6YbAbyi3TzNxweL
         ttrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0tqEfhBxqaticqeZ9OWtTu0fvmbKytZC43cTizzEEHVclp/MMlH60CIZOp7YkAUwBn6xrPRC8v9Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyqWw7/qX76637992vFtyUjbT4N9J3AjygeJTUfpvn2djjL4NB
	a0FgP4cau3H56ErC29OoKbWkKgmh8OUUChXIr/o1sBbiPWEVTDBL4cfh
X-Gm-Gg: AR+sD10jlHhL/g9pZZHLhtELnMxIFlBIAJsw48XlN458/9ZXnIkOeunVXGo5WR5DZh4
	F5eh1HlojJ50Yh11i07e9i36zoKVtDrl0Dmq4Cv+e59DOw4tSz8DjbpFVQ5oqQqHqf8EUx5g4iR
	nbOu2S6m8F/q3rMtADEWHKQnb0CGehqy3T2vWveqMWAkhRxagwYGMj12kJsQBoCVBnIdXQiHdOE
	3bx/sVW7Wj4V6W2+lqAEiD83jwuXRoA2fqfo4PCzHfLQCtg5oJwLnGyMSEXV9sfl/C8sS0Z6IWy
	bur5sQivQb+Y6ZvXfrI7ukPcgzCanENkuLC/+ZWxDb8RGklPd8VOdXpbvjRm0q+tv+ilki62iI3
	efcDviS010oT015D5QYwJwAmCWxfUQFHH9c1Sywrd9Ojc+BQT7Js5a1VNAFS5xRwGheAD6ewOYe
	e4eXhGe+qlqZKRNHVhv3ilgzuxMJHw+t7dF7K+2iUjPDBUpln8j1wB+8YXhOuAMMANkhjCoE33W
	3PdJmW7WzQDB+aICw==
X-Received: by 2002:a17:903:1585:b0:2c9:97a7:71ab with SMTP id d9443c01a7336-2d035d0097cmr15283805ad.38.1785394297603;
        Wed, 29 Jul 2026 23:51:37 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bca9d7sm21707555ad.52.2026.07.29.23.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:51:37 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH] RISC-V: KVM: Add arch-specific tracepoints
Date: Thu, 30 Jul 2026 14:50:48 +0800
Message-Id: <20260730065048.3715824-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy2Qa2DGFzb27MgmoH5Pf1BOrgwaZBqP__U9eejs5-5Bsw@mail.gmail.com>
References: <20260626103619.174179-1-yhchen312@gmail.com> <CAAhSdy2Qa2DGFzb27MgmoH5Pf1BOrgwaZBqP__U9eejs5-5Bsw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_235138_982974_E5A822AE 
X-CRM114-Status: UNSURE (   9.05  )
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

Hi Anup,

Thanks for the review.

I've addressed your comments in v2.

On Tue, Jul 28, 2026 at 09:05:39PM +0530, Anup Patel wrote:
> Drop kvm_guest_fault, kvm_sbi_ecall, kvm_wait_riscv, and
> kvm_csr_access tracepoints. Instead add common
> kvm_vcpu_exit tracepoint for all vcpu exits just before the
> switch case in kvm_riscv_vcpu_exit() function.

Done. kvm_vcpu_exit now reports the full trap context
(sepc/scause/stval/htval/htinst) and is placed just before the switch
case, after the CAUSE_IRQ_FLAG early-return, so it fires only for
synchronous traps.

> Drop the kvm_irq_line and kvm_timer_update_irq tracepoints.
> Instead add common kvm_vcpu_irq tracepoint called from
> kvm_riscv_vcpu_set/unset_interrupt() function.

Done. kvm_vcpu_irq is called from kvm_riscv_vcpu_set_interrupt() and
kvm_riscv_vcpu_unset_interrupt(), covering all callers.

> The kvm_mmio_emulate tracepoint is fine.

Kept kvm_mmio_emulate unchanged.

v2 follows in this thread, with example trace output captured from QEMU
included in the commit message.

Thanks,
Yuhang

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
