Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A509CC5AC82
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 05:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PujayFgrYbh27ectG/AAjbabEwiMjaKxeZqbnsDnAtk=; b=sYioBa7f3b9egi
	jYSavr4PpurJP+qs7sZMNXagmkrDa7k2LtnXv/6M1UW2rsMmzrjNeFpA0OVze2v/UmsggKA/owqm6
	KOWOaYMHs0ETX3cLn3VH8VHlFUiYHv4xyiKqLTRKdphN5x8WGMteKJSuKPrav06+3WaveuEhKx5/3
	9m0fCNgOuKUuelWImqwHCRlOKdyTJxAKRDw5e9caZdv/qNo9FjUolOxuxZTm3Zy5cgtzQa39zCVSn
	OdP/Wjmskk2b1UvuS42Md5mzMA2INDMb4SjVfEfTyZEl5pm6S86Mr2Hh6jkPZCwI6I/3rSFsbw0sp
	hR11nT5hiEGOCApYaOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtINq-0000000B2DT-1WbS;
	Mon, 10 Aug 2026 05:17:10 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtINn-0000000B2C5-3JGU;
	Mon, 10 Aug 2026 05:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=Qohe9NvYIz
	9HaXfgOLxozIyLWqbZILHSQoPxrkrR74s=; b=XsZHZh/0PeIMdPBmP24UfxXBe5
	XZwtrf3k9gRzlQjsLrPuylJXvDvkMPNLYVqEoCKqQn+jA1qiHiBUcgJjywFCCvTG
	ETlADVmbnGZXBcpD+PtG5UJ5ww2Y2UUeI/G106nIRPmZqBv4E7PB0hRn1fn4w8wk
	RyuImQ8de6o3eRdrQ=
Received: from ultrarisc.com (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOZXnlq2JYWAA--.18693S2;
	Mon, 10 Aug 2026 13:16:18 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>,
	kvm-riscv@lists.infradead.org
Cc: Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>
Subject: [RESEND PATCH 0/2] RISC-V: KVM: Fix G-stage fault handling
Date: Mon, 10 Aug 2026 13:15:42 +0800
Message-Id: <20260810051544.3953925-1-xb@ultrarisc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: AQAAfwAnEkOZXnlq2JYWAA--.18693S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrW7Wry7tFW3tr47CFW3ZFb_yoWfZrg_Wa
	10k3429an5XFW7ta4UKanYyrW0krWrGryfZry0yFZrGa4UursxKay0vw1fXrW8JF4YvFn8
	Cry5Ar93Zw1I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgXocUUUUU=
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAMB2p1VlUAFAAMsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_221708_198426_5320E635 
X-CRM114-Status: UNSURE (   6.30  )
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

The original posting did not reach the mailing lists because of a sender
configuration error. There are no code changes in this resend.

Fix two error paths in RISC-V KVM's G-stage fault handler.

The first patch releases a faulted-in page as unused when an MMU
invalidation prevents the page from being installed. The second patch
translates KVM_PFN_ERR_SIGPENDING to -EINTR instead of treating an
interrupted host fault as an invalid mapping.

Both issues were found while wiring pre-fault memory support, but affect
the existing vCPU fault path independently.

Tested with a full RV64 kernel build.

Xie Bo (2):
  RISC-V: KVM: Release unused page after MMU invalidation
  RISC-V: KVM: Propagate interrupted G-stage faults

 arch/riscv/kvm/mmu.c       | 10 ++++++++--
 arch/riscv/kvm/vcpu_exit.c |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)


base-commit: dfdf1374fdeccb5b7e3d35186228e01ec5ea5f01


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
