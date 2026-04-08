Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC7DFD5F77
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zmNcAxfkZVpDHJAr+NTHHqRWvNBlBGfA33M3uzkJMwU=; b=jHWeKXdGiru8Hc
	lJpfQyhliwUqpiX7sNNyk5gfjZnzGyzh/F4H0kTUYmUGpMTodaR8N2H1TqjR8iVmNyqEskda2yMSo
	9GGCe0NqYMRT3IhUOrSlhkMm02afmoyxe0UhOVr38gq/D3c5XTOxOrhmhFMEyksQObFIIDJxT/8aB
	hBnmEgWTl7/D4ci7noaO2F4sjyVUv7Ial4BDaahBLXui+fHYLH5IcLcSCOq5XTSpW7el1UIOkqyxy
	yEB6ilw4pDmvyCu+cVd4uxJHpus/h7fdJ4wea0CJ0dWE2GIRf/WXOE/h0ziIKNh/emoxA7k0h6dGE
	O/SkzpBNCOdmkK9pMzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoK-00000008Edd-328g;
	Wed, 08 Apr 2026 04:46:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoH-00000008Ea0-4BMa;
	Wed, 08 Apr 2026 04:46:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 394A743F2C;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 127D1C19424;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623596;
	bh=rAI1CPLDiRKGIxKOZmRu8/zalWKsDkVpDctGcchvfIE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UroqgO/4mQ09I7T4jvzkHwNdCpGsZc8rmjHLbjIkjkl495lJt5j6yzjAHJx2pBslp
	 ETm+G8/z0gOneW8dOUjryk/s3FHuMaLbB50jZkp2fODCbqHEjMouYysSKculq7rZ9G
	 7SW/mKWmLwvDO6VvNwlnxiKMdcgo7xymRAQtyFjzsvIwVfn3jWEfjYjlGidqGwpFp0
	 pI1g0PSPjZ5QZJVogOpWqHlezLRfa55VR+b6Tr/0mFST/6rpyJ0V6WX1iiudunkNUj
	 4+7mLonESwNOdLCUQiAFKoqzIYat/kQbnAPn2qi5mYO7Lc8nzIZKnC0zYQYn9g9utJ
	 zg87MlXvkcPkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0770CFD5F73;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Subject: [PATCH 00/16] riscv: Generate riscv instruction functions
Date: Tue, 07 Apr 2026 21:45:48 -0700
Message-Id: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHzd1WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MT3aLM4uSy+My84rz4ksSknFRdYwsTS1MgSklLMVYCaisoSk3LrAA
 bGR1bWwsAp7/tpmIAAAA=
X-Change-ID: 20260114-riscv_insn_table-38495495dfd3
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=4407;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=rAI1CPLDiRKGIxKOZmRu8/zalWKsDkVpDctGcchvfIE=;
 b=7x4PTXIx7EN/ZzSPl1d5lxpRaBvp9CB1dq+sX9CzPHHqqpAtcEoH3dqwO/afl/RvHYNThe8tm
 1JDOesSdpzHC7U26ZY76EtB28pEehaqQG4YrIuubLCvZW2hYfdIYjkF
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214638_081158_34719D55 
X-CRM114-Status: GOOD (  14.73  )
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
Reply-To: thecharlesjenkins@gmail.com
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

The instruction definition table is generated from the riscv-unified-db[1],
an open source RVI project for instruction specifications. I am sending
this series at the same time as I am sending the patch to the
riscv-unified-db for the format of the instruction table. That patch can
be accessed on github [2].

A lot of the validation for these changes is from running all possible
32-bit or 16-bit integers through these functions to see that any given
instruction will produce to expected result. I give more detail on the
test cases in the notes of the first couple of patches.

For the KVM patches, I also introduce two test cases to ensure that the
instruction manipulation is working as expected, along with a bug fix of
the current implemention.

[1] https://github.com/riscv/riscv-unified-db
[2] https://github.com/riscv/riscv-unified-db/pull/1780

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
Charlie Jenkins (16):
      riscv: Introduce instruction table generation
      riscv: alternatives: Use generated instruction headers for patching code
      riscv: kgdb: Use generated instruction headers
      riscv: kprobes: Use generated instruction headers
      riscv: cfi: Use generated instruction headers
      riscv: Use generated instruction headers for misaligned loads/stores
      riscv: kvm: Use generated instruction headers for csr code
      riscv: kvm: Fix MMIO emulation for sign-extended insns
      KVM: device: Add test device
      KVM: riscv: selftests: Add mmio test
      riscv: kvm: Use generated instruction headers for mmio emulation
      riscv: kvm: Add emulated test csr
      KVM: riscv: selftests: Add csr emulation test
      riscv: kvm: Use generated instruction headers for csr emulation
      riscv: kexec: Use generated instruction headers for kexec relocations
      riscv: Remove unused instruction headers

 arch/riscv/Kconfig.debug                      |    1 +
 arch/riscv/Makefile                           |    3 +
 arch/riscv/include/asm/Kbuild                 |    1 +
 arch/riscv/include/asm/insn.h                 |  563 +---------
 arch/riscv/include/asm/kvm_host.h             |   10 +
 arch/riscv/include/asm/kvm_vcpu_insn.h        |    5 +-
 arch/riscv/include/asm/kvm_vcpu_test_csr.h    |   15 +
 arch/riscv/kernel/alternative.c               |   23 +-
 arch/riscv/kernel/cfi.c                       |    6 +-
 arch/riscv/kernel/kgdb.c                      |  102 +-
 arch/riscv/kernel/machine_kexec_file.c        |   55 +-
 arch/riscv/kernel/probes/decode-insn.c        |    7 +-
 arch/riscv/kernel/probes/simulate-insn.c      |  253 ++---
 arch/riscv/kernel/probes/simulate-insn.h      |    7 +-
 arch/riscv/kernel/traps_misaligned.c          |  183 ++--
 arch/riscv/kvm/Kconfig.debug                  |   16 +
 arch/riscv/kvm/Makefile                       |    1 +
 arch/riscv/kvm/vcpu_insn.c                    |  233 ++---
 arch/riscv/kvm/vcpu_test_csr.c                |   21 +
 arch/riscv/tools/Makefile                     |   22 +
 arch/riscv/tools/insn.tbl                     | 1391 +++++++++++++++++++++++++
 arch/riscv/tools/insn_tbl.sh                  |  263 +++++
 include/uapi/linux/kvm.h                      |    2 +
 lib/Kconfig.debug                             |    6 +
 tools/testing/selftests/kvm/Makefile.kvm      |    2 +
 tools/testing/selftests/kvm/riscv/csr_test.c  |  123 +++
 tools/testing/selftests/kvm/riscv/mmio_test.c |  184 ++++
 virt/kvm/Kconfig.debug                        |   16 +
 virt/kvm/Makefile.kvm                         |    1 +
 virt/kvm/kvm_main.c                           |    8 +
 virt/kvm/mmio_test.c                          |   95 ++
 virt/kvm/mmio_test.h                          |   18 +
 32 files changed, 2624 insertions(+), 1012 deletions(-)
---
base-commit: dd9b004b7ff3289fb7bae35130c0a5c0537266af
change-id: ${change-id}

- Charlie



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
