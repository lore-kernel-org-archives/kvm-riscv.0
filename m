Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B4DC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 07:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4mla3yl0l7QfeVJ3vQFicuPdaj448fvQGFEjP46Gl8=; b=CfgICBI6aXFcqE
	sTS3dr7Nj5z5z9a3hPVxQHhs6DahhmegwTB49V7R6CjZW0S1nKNwlsLVgMIaSY4NLNdXCAYyicgEi
	4H97VdVGdGKtOqW55BnGeUKP7rn8oL409g2adBmgHn5lPJPfHHTBNmkNwc5w7v56vpbJpiF4NvXKN
	2ZGeqz/GUiNBxPq3ComKazb20fbdP7kXmCPg0crF9GyB7hKeKzX1HrlE3f+MW+GraZUSK1RoazClC
	vhG9qkMx7zKu3CUU8/gEyEjQvT4M53U1dfL7DGvlKWPc5GgoTmbgLpL998z1bLWoD9WHqlEh0pDIE
	N+VcG5eSiaPGNax+GRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBB3-00000008RBa-2cuk;
	Mon, 13 Jul 2026 07:34:09 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAy-00000008R5F-40uH;
	Mon, 13 Jul 2026 07:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=5EsQAGcW3lKZK7yZPg3wu2Pv2XPmCi8qN8
	NuZceqpd0=; b=GXgBy5PlYQz1xx/8DoEMpeNDbnJZ/beB2bjgXsH9MPpUDIYRsL
	hiZcQqdtffz6tfUt6waWDecTjsE6pUWlZLM+6wZTekQkzKlNE16rByk1ohdrCoOC
	50qJ4SH1MFdbGVcQDGtzNlZBZMtG+BXL0DtdKDfMpyOoqy9WgrSF9sbq4=
Received: from ur-dp1000 (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUL5lFRqtIEQAA--.16562S2;
	Mon, 13 Jul 2026 15:34:20 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>
Cc: Xie Bo <xb@ultrarisc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Fix lost virtual interrupts during IRQ sync
Date: Mon, 13 Jul 2026 15:33:36 +0800
Message-ID: <20260713073346.1293408-1-xb@ultrarisc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAAhSdy3_YnzNiSE=KykriwSWU8X2CLhdr2E8CB=32JxA_L7caA@mail.gmail.com>
References: <178159067899.108868.8176174463274678253@ultrarisc.com> <CAAhSdy3_YnzNiSE=KykriwSWU8X2CLhdr2E8CB=32JxA_L7caA@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: AQAAfwAnYUL5lFRqtIEQAA--.16562S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4kGFy3uw4fJF4fGw1UGFg_yoWxKFg_Wr
	yrZ39rG34xJw4ay3Z5Xrna9rsagw1kAw4xGws7uFn7Jwn8AFs3WaykCrnxuwsxJayFya45
	tr18Wa1fAan3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbT8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU52NtDUUUU
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAHB2pUYNAAEwAIsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003405_308856_96C312A2 
X-CRM114-Status: UNSURE (   4.54  )
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

After sending v3, I found that kvm_riscv_vcpu_has_interrupts() held
irqs_pending_lock while the AIA helper could acquire the IMSIC
vsfile_lock. Since vsfile_lock is sleepable on PREEMPT_RT, this creates
a sleep-in-atomic issue. IMSIC update paths can also acquire the locks
in the reverse order, creating an ABBA lock ordering cycle.

I fixed this in v4 by splitting the AIA high pending bitmap check from
the IMSIC VS-file check. The bitmap check remains protected by
irqs_pending_lock, while the IMSIC check runs after releasing it.

The v4 patch is still based on Linux 7.2-rc3. Both RV64 and RV32 KVM
builds pass, and checkpatch reports no issues.

The v4 patch follows this reply.

Regards,
Xie Bo


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
