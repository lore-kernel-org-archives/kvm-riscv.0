Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B63C44503
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rfaJtcaY0HvuzS4opWNlPpFoPc+TAJSM5E7qQzRJkTk=; b=3P+Qa5RFBiBR0k
	yncY26v5p51zBxNA0Ob0oD+PAJpwGwPgihLboCCzXsFyG0BpkEA5gU6Sm/s+WXtNS58LIEj1aAafz
	7/QaEbVvjmyX0WOmhlLxCc01mDdDnsNYDmIc2pRGn/1+kXCdOdjR2feUesm7r47Jh2nAB3vmjoWgv
	yPWfRNLlVFLWyaBOrLg31xSF9rZeFXCN/H6CjOcv4lRh4y8zhFhefGifxWUFQ5NCTZIjNFI5MdlMZ
	2TXNX/vS7TbecNfjElTtgWArZ5Z5l2YzzY8IF29fQCJwTurBspEtK89xJ8kb43Gl+QF4+K9ov52kv
	Nug4gQGyCwDtOxk12ZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5E-0000000GFab-0QwJ;
	Wed, 08 Jul 2026 03:36:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5A-0000000GFYG-3Q1T
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cacf197759so3892595ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481779; x=1784086579; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CvczDvHK6doetNfCiPotMmHZg7w7Gu6Nh6hG9FaOUNw=;
        b=d/Y6PLBrOp2ewJiU2/v7Nu+IqH+p0Nyz0Y1w03DSGIuQ3f4CoM7RX1k7Cf6Fu8ZvSM
         YS/QPnvka4Cgcx/eEtJC/40npJbEzex6SorJQGa8HmCxh0EfQDUx7uRuc6jUP65IU8cl
         Hm2qqoLXQ6TsOYyaCXUaqDq3et26jktC93Do5gQRy9NILMQqAI2FB/RaS6d6Wu9KgWf/
         /eKBrSfHkACFXrixhyeAt/8HR4gMT0DU5uTiKs9siAWProe2WSlQfSyThB7MhzPaACgC
         kNaYLtEWUBp12yLMw7UzJLvwSZ8qet7+7nw42AA4nh/0Oz3GISg8O+y1meqZ0j//7gHo
         rUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481780; x=1784086580;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CvczDvHK6doetNfCiPotMmHZg7w7Gu6Nh6hG9FaOUNw=;
        b=A3Tu7BVJ1z5ZxarZ3d93Zed+hCQasRI0rCUeN87865xeIq+pJdzgzSFrCMJe0AAhc+
         Twn1kQF4SOd4KlEhw+SJ/HHUmfPVUegLsn9Yy5xYlCNm9ckJZTYtqhtdhpmJHD7sRi9N
         x2ajE12ez1Ka7ET32yPXfcP0YzZ9F3EzikLuWBQOenJ1W9Tzr9NYvCdyDhrVp1Y82Ctg
         RPenYArAkeYVu2elSHp7/LOl44Ah2jbvBgXRihLJilNu0sNeHiOOz00OADs+teNtIbF8
         OxQ6ncpXjdM9ldpPI0edN6y9OrXDZXmZcVtdr1SXOA2WotZxQ8r7KlVskeLe5lGubO/N
         lD+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpskkmWrxKbyCHxLyOWkfv0oGOyL0sg8PjZjkJm4jxQDKDSVzumeXtG4FZaSDxOdLBVxlUuP/3GKvw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyVdKEXwLA9/ht0XLqYXIX6BhQVguK7cLJOKll8QlZQiskeHmG
	LAPHWgKZWZk6+o6P2CbjwI6J2aCS4s/Z40heMNRmmquKpHCp2tQ/oZuO
X-Gm-Gg: AfdE7cnaZf0hzIwOdfsfSr9ElT4U5Hdxoq9P4iiAA5YjpwoWEKypfT07r38ZwxPVfk9
	//3Ed0Y82Ees1G/wSrZQRJQVakGKCUxzQLwv++nOo00xc9W5TeMNpEEcsezgPst378PtuVlmlJr
	TyDO/EhacKxUvyGLTz5wVdDo/loEjp9Sq/TYojECuK12R8ApuNzyZbNnpq5fpup0wHRRuEvLT4H
	jWbQy+/tCwp0JVztGvAe3StuMDdcHosw9MxcC+jLitm1Q7bSfVEiifPr6qPnRQaGWjpyouTlTAk
	4KHej3eqtYC4NJzV7wNpiD8vPjUYYvKSo3JHughCGJw/ewDeEQ4/8K68ZI7+5+2/pa7VRWr5r93
	IuERO7wKF9HdmB0ZQJSA3acxi6ivCP3WtGKw1CJsLQ353S2fGFwW4rc56F/234AHwlSEA9JcFxy
	sj6uoAHNPa8tM/PjuZieLCOP17/jYR5XI4L/iezrk=
X-Received: by 2002:a05:6a21:400d:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c0bd2ab6e9mr593638637.64.1783481779487;
        Tue, 07 Jul 2026 20:36:19 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:18 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: [PATCH v3 00/17] riscv: Generate riscv instruction functions
Date: Tue, 07 Jul 2026 20:34:23 -0700
Message-Id: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NSwqDMBCA4atI1k3JS2O76j1KkaijDmhSEgkt4
 t0b7aKFFmbzD8w3CwngEQI5ZwvxEDGgsynkISPNYGwPFNvURDBRMM4V9RiaWKENtppNPQKVpTr
 ladqulSSd3T10+NjJ6y31gGF2/rl/iHzbvjHF9C8WOWU0V7XSsjActL70k8Hx2LiJbFgUH6AQ/
 A8gEqA7VnIGIIRW38C6ri/RvYl08QAAAA==
X-Change-ID: 20260114-riscv_insn_table-38495495dfd3
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=5854;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=j+4xd4UFPYMx31RI3oZhzKH55RnIh5Q4blgoRCeJwgw=;
 b=74eWphOVMu50WOZqGrtcoyw4AkgM3MK/BcaxvTUNxBiKAeL2V+Dwf1fwKvxtcqNIRQUDzq+pX
 UPNo3RbM/isDYKuYo8hYptrVM53U/y987iMR9BJFZ9OW4w9uDqv1I4a
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203621_009899_E1043138 
X-CRM114-Status: GOOD (  18.92  )
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

There is a lot of code that is manually manipulating riscv instructions.
Constructing these headers for new instructions is time consuming and
error prone.

The first patch in this series introduces the instruction definition
table along with a script that runs at compile time to create all of the
associated instruction manipulation functions. The remaining patches
migrate all of the manual instruction code to use these generated
functions.

The instruction definition table is generated from the
riscv-unified-db[1], an open source RVI project for instruction
specifications. I got this table generation merged into
riscv-unified-db, that PR can be accessed on github [2].

After a format update PR is merged [3], I will link the commit hash of
the generated instructions.

A lot of the validation for these changes is from running all possible
32-bit or 16-bit integers through these functions to see that any given
instruction will produce to expected result. I give more detail on the
test cases in the notes of the first couple of patches.

For the KVM patches, I also introduce two test cases to ensure that the
instruction manipulation is working as expected.

[1] https://github.com/riscv/riscv-unified-db
[2] https://github.com/riscv/riscv-unified-db/pull/1780
[3] https://github.com/riscv/riscv-unified-db/pull/1869

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
Changes in v3:
- A lot of Sashiko suggestions
- Introduced new patch "riscv: Maintain epc on misaligned emulation
  error" that will help with error handling
- Use CONFIG_32BIT/CONFIG_64BIT instaed of __riscv_xlen for generated
  instructions
- Link to v2: https://patch.msgid.link/20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com

Changes in v2:
- rebased on v7.1
- I dropped the patch fixing the mmio bug in kvm because in the
  meantime that bug has been fixed in a different patch
- Calls to panic() for instructions not support on current hardware have
  been changed into BUG_ON()
- Fixed incorrect handling of branches in simulate_*()
- Added CONFIG_RISCV_KPROBES_SIMULATE_KUNIT for more detailed
  simulate_*() testing
- Updated insn.tbl based on new merged in changes to riscv-unified-db
- Link to v1: https://lore.kernel.org/r/20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com

---
Charlie Jenkins (17):
      riscv: Introduce instruction table generation
      riscv: alternatives: Use generated instruction headers for patching code
      riscv: kgdb: Use generated instruction headers
      riscv: Add kprobes instruction simulation KUnit
      riscv: kprobes: Use generated instruction headers
      riscv: cfi: Use generated instruction headers
      riscv: Maintain epc on misaligned emulation error
      riscv: Use generated instruction headers for misaligned loads/stores
      riscv: kvm: Use generated instruction headers for csr code
      KVM: device: Add test device
      KVM: riscv: selftests: Add mmio test
      riscv: kvm: Use generated instruction headers for mmio emulation
      riscv: kvm: Add emulated test csr
      KVM: riscv: selftests: Add csr emulation test
      riscv: kvm: Use generated instruction headers for csr emulation
      riscv: kexec: Use generated instruction headers for kexec relocations
      riscv: Remove unused instruction headers

 arch/riscv/Kconfig.debug                           |    1 +
 arch/riscv/Makefile                                |    3 +
 arch/riscv/include/asm/Kbuild                      |    1 +
 arch/riscv/include/asm/insn.h                      |  563 +-------
 arch/riscv/include/asm/kvm_host.h                  |   10 +
 arch/riscv/include/asm/kvm_vcpu_insn.h             |    5 +-
 arch/riscv/include/asm/kvm_vcpu_test_csr.h         |   15 +
 arch/riscv/kernel/alternative.c                    |   23 +-
 arch/riscv/kernel/cfi.c                            |    6 +-
 arch/riscv/kernel/kgdb.c                           |  102 +-
 arch/riscv/kernel/machine_kexec_file.c             |   55 +-
 arch/riscv/kernel/probes/decode-insn.c             |    7 +-
 arch/riscv/kernel/probes/simulate-insn.c           |  253 ++--
 arch/riscv/kernel/probes/simulate-insn.h           |    7 +-
 arch/riscv/kernel/tests/Kconfig.debug              |   13 +
 arch/riscv/kernel/tests/kprobes/Makefile           |    2 +
 .../kernel/tests/kprobes/test-kprobes-simulate.c   |  250 ++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.h     |    6 +
 arch/riscv/kernel/traps_misaligned.c               |  209 ++-
 arch/riscv/kvm/Kconfig.debug                       |   16 +
 arch/riscv/kvm/Makefile                            |    1 +
 arch/riscv/kvm/vcpu_insn.c                         |  264 ++--
 arch/riscv/kvm/vcpu_test_csr.c                     |   21 +
 arch/riscv/tools/Makefile                          |   22 +
 arch/riscv/tools/insn.tbl                          | 1392 ++++++++++++++++++++
 arch/riscv/tools/insn_tbl.sh                       |  258 ++++
 include/uapi/linux/kvm.h                           |    2 +
 lib/Kconfig.debug                                  |    6 +
 tools/testing/selftests/kvm/Makefile.kvm           |    2 +
 tools/testing/selftests/kvm/riscv/csr_test.c       |  133 ++
 tools/testing/selftests/kvm/riscv/mmio_test.c      |  189 +++
 virt/kvm/Kconfig.debug                             |   16 +
 virt/kvm/Makefile.kvm                              |    1 +
 virt/kvm/kvm_main.c                                |    8 +
 virt/kvm/mmio_test.c                               |  103 ++
 virt/kvm/mmio_test.h                               |   18 +
 36 files changed, 2951 insertions(+), 1032 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260114-riscv_insn_table-38495495dfd3

Best regards,
--  
- Charlie


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
