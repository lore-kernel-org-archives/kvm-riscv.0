Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9339CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kzyi8cX9vjLnQEG+fFdym4KBdHrY4L0Eo7nRt3YJTcQ=; b=OY+uvmQFlApMsB
	V4eO/mYwqksKMDOy3lx5QI1IteuHqDc7EWwHykdDV+eMmf4Uvp9SIQEMZ4nTthjQqx6CcwJptnRzy
	WVuObCXquC1SfIEY5vr9ZUJ79qxZxDpzVY59KMUDS/DKRUy1FLedXNTEoHXL0e/m5o7Q62AmTAJoW
	UltRYViNBlDpeTkVbQlpUK8S0geevYs4KLvD7yuuxflQP8S+TqQOJg/gShUilZFXNlEeJQGRA08Vt
	XkkLD13l5X9vi4zEGLI8xIJ/d96/Bggu8NhYozhZey8jJ4Np3C7o5pa6ZNIrNSs73w5s1BDq8Zkgn
	iv13KghGZF8T9Yuqh8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAi2-00000000EqV-40S0;
	Thu, 21 Aug 2025 19:12:26 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5lj-0000000H8U7-2PJD
	for kvm-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 13:55:58 +0000
Received: from ROG.lan (unknown [118.251.176.166])
	by APP-03 (Coremail) with SMTP id rQCowAAngIFZJadoCYkTDg--.22571S2;
	Thu, 21 Aug 2025 21:55:39 +0800 (CST)
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	anup@brainfault.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	cyan.yang@sifive.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	namcao@linutronix.de,
	jesse@rivosinc.com,
	inochiama@gmail.com,
	yongxuan.wang@sifive.com,
	ajones@ventanamicro.com,
	parri.andrea@gmail.com,
	mikisabate@gmail.com,
	yikming2222@gmail.com,
	thomas.weissschuh@linutronix.de
Cc: linux-riscv@list.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	pincheng.plct@isrc.iscas.ac.cn
Subject: [PATCH 0/5] RISC-V: Add Zilsd/Zclsd support in hwprobe and KVM
Date: Thu, 21 Aug 2025 21:55:22 +0800
Message-Id: <20250821135527.224044-1-pincheng.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAngIFZJadoCYkTDg--.22571S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1kJF1xGr15GFy8Gw1xXwb_yoW8trW5pa
	n5Cw15KF1kXFy7C34fAr48ur1rKF4ru393Jrn3t348WFW3Cr95Jr9ak3ZxZF18ArZ29ry0
	93WrKw1I93Z7AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUWVWUuwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUU0JmUUUUUU==
X-Originating-IP: [118.251.176.166]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_065555_976649_E8AD3070 
X-CRM114-Status: GOOD (  10.58  )
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

Hi all,

This patch series adds support for the recently ratified Zilsd
(Load/Store pair instructions) and Zclsd (Compressed Load/Store pair
instructions) extensions to the RISC-V Linux kernel. It covers device tree
binding,ISA string parsing, hwprobe exposure, KVM guest handling and selftests.

Zilsd and Zclsd allow more efficient memory access sequences on RV32. My
goal is to enable glibc and other user-space libraries to detect these
extensions via hwprobe and make use of them for optimized
implementations of common routines. To achieve this, the Linux kernel
needs to recognize and expose the availability of these extensions
through the device tree bindings, ISA string parsing and hwprobe
interfaces. KVM support is also required to correctly virtualize these
features for guest environments.

The series is structured as follows:
- Patch 1: Add device tree bindings documentation for Zilsd and Zclsd
- Patch 2: Extend RISC-V ISA extension string parsing to recognize them.
- Patch 3: Export Zilsd and Zclsd via riscv_hwprobe
- Patch 4: Allow KVM guests to use them.
- Patch 5: Add KVM selftests.

This series of patches is a preparatory step toward enabling user-space
optimizations in glibc that leverage Zilsd and Zclsd, by providing the
necessary kernel-side support.

Please review, and let me know if any adjustments are needed.

Thanks,
Pincheng Wang


Pincheng Wang (5):
  dt-bidings: riscv: add Zilsd and Zclsd extension descriptions
  riscv: add ISA extension parsing for Zilsd and Zclsd
  riscv: hwprobe: export Zilsd and Zclsd ISA extensions
  riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
  KVM: riscv: selftests: add Zilsd and Zclsd extension to get-reg-list
    test

 Documentation/arch/riscv/hwprobe.rst          |  8 ++++
 .../devicetree/bindings/riscv/extensions.yaml | 39 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  2 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  2 +
 arch/riscv/include/uapi/asm/kvm.h             |  2 +
 arch/riscv/kernel/cpufeature.c                | 24 ++++++++++++
 arch/riscv/kernel/sys_hwprobe.c               |  2 +
 arch/riscv/kvm/vcpu_onereg.c                  |  2 +
 .../selftests/kvm/riscv/get-reg-list.c        |  6 +++
 9 files changed, 87 insertions(+)

-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
