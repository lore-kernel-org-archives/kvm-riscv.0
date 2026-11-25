Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05D606A327
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=04HNQIUv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BiMs2UCl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qgMkA+dV3qfX2zeSWVsUlM82OhNA6uiRY6Vxz+GYtaw=; b=04HNQIUvoV0n5QB45JkbJaYOAh
	wJ4hbfNiE/OKjaruozQE+KaKjw4mvRqBWPe2ApmgrVjn+FXFi8+aONt4B8jJoJAu3m4u6i34LWNdx
	oZhzfQOYdQUk2Nf6xaf7+IFaQlmyEwRUZCCBMhaRA70ykY6YM2IATt8UJ8NZvEQi1nylaM+ni5Z4i
	aFOlR4ww6pvXJonaBixAvOn04OZ48eSSuKwLaP4mtNrYcjiweMpafe+hgE8U2Kui4GCymqqqrAmwH
	3G+cU/Jxeiz5aGAUDguMX0tAX23vHqrayhBHKTSI3hPXejaZodmlWWyjzD3Ib23W7hYF2vV0WpbaU
	oOKglAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23w-00000008CuL-1HRl;
	Wed, 25 Nov 2026 01:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23v-00000008CtG-1LIr
	for kvm-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 01:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=pxBQm/dFc4CBZiJZ31NoNTLOKC8VnahQcUsRg90O64E=; b=BiMs2UCljNpQKRanxHkihsKnGY
	NiUyi5oQumwYv3xfSpletCFQMSdM689bdOGL27G4tJbCs1l6zOfvYvYkkMUJ7NLYo6MChOpcm1gf+
	VBfWeFEu6KgBPfNNsmPfEN7Cts4DJDihIDCg+IJOz9HXt7nxOdtd9odF8L1L/p3hGsVFV83tI8AcC
	5B98LCPyzFwo5giYFNjjG+MU2O9FZgOGR5w3sptwLzk2tv2XKwixANoqlq7Q2kf1ZOzil8jm2hAkA
	EOnxZtTClCiDdTL9E+AsQ6bsDg8uwxrX2pvMVRXYc7LeXSVeijygUDKWsAX25D4Ae1Uu9gler4uDT
	hYxE6exQ==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23q-00000004jXW-10w8
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:41 +0000
Received: from localhost (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowACXp5h3PQZrj9m8AQ--.815S2;
	Wed, 25 Nov 2026 09:44:25 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 0/9] riscv: ACPI boot and BRS-I SBI tests
Date: Wed, 25 Nov 2026 09:44:00 +0800
Message-ID: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACXp5h3PQZrj9m8AQ--.815S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JrWUuFWkuw4DCw1rGFWUCFg_yoW7GFy5pF
	ZxWrySkr93GFyxZws3Zw18GryrAr1rua13tr1xXw45u3yxGrWDXrs3Kw4jyFn8GF1rAa12
	9F4F9F4rCrn8G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUfR6wUUUUU=
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_014438_845304_B1BBCEAA 
X-CRM114-Status: GOOD (  18.20  )
X-Spam-Score: -2.3 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series lets RISC-V kvm-unit-tests boot on BRS-I platforms that
describe the system with UEFI + ACPI instead of a device tree, and adds
a first unit test for the SBI rules in the RISC-V Boot and Runtime
Services specification [1].

The RISC-V port currently assumes a DT for CPU bring-up, timer
frequency, ISA-string parsing and console setup. BRS-I firmware
typically does not provide a usable DT, and often has no MMIO UART
either. Without these changes the existing tests abort in setup before
they can exercise SBI.

Patches 1-4 teach the RISC-V library to initialize from ACPI when a DT
is absent:

- locate the ACPI 2.0 RSDP via the EFI configuration table
- parse MADT RINTC entries for hart / CPU bring-up
- read the timebase frequency from RHCT
- parse the ISA string from RHCT Hart Info nodes (match by ACPI UID)

Patch 5 falls back to the SBI DBCN console when UART initialization
fails, so ACPI guests without an MMIO UART can still print. Patch 6
drops the early exit in the EFI runner that previously rejected
EFI_USE_ACPI=y.

Patch 7 moves isa_init() into cpu_set_fdt() and cpu_set_acpi() so
cpu_has_extension() can read every hart's ISA bits from the boot hart,
including secondaries that have not started yet.

Patch 8 captures S-mode IMSIC interrupt file addresses at boot time.
The DT path is Andrew's posted patch [2]; the ACPI path copies
RINTC.imsic_addr only when an IMSIC structure is present in the MADT,
as ACPI requires OSPM to ignore that field otherwise.

Patch 9 adds riscv-brs, a unit test that checks the SBI requirements
from the BRS specification (version, HSM, TIME/Sstc, IPI/IMSIC,
RFENCE/IMSIC, PMU/Sscsrind+Ssccfg, and DBCN when SPCR type is 0x15).

v3 changes
==========
Address review comments from Andrew Jones on v2, except the three
points in the next section.

- call isa_init() from cpu_set_fdt() / cpu_set_acpi() rather than
  looping in cpu_init()
- RHCT parsing: (void *)node, reverse fir tree, assert_msg, treat a
  bad offset as an assert
- drop unnecessary CONFIG_EFI guards around <acpi.h>
- check Sstc and Sscsrind+Ssccfg on all present harts
- use thread_info.imsic_addr instead of parsing IMSIC in the test
- ACPI IMSIC: ignore RINTC.imsic_addr unless an IMSIC MADT structure
  is present
- coding-style nits (braces, SBI enum alignment, report_skip wrapping,
  "Initialize" capitalization)

Differences from the v2 review
==============================
1. Console policy (patch 5)

   The suggested diff prefers SBI DBCN whenever CONFIG_SBI_CONSOLE is
   set and DBCN probes successfully, with UART as a fallback.

   This version keeps UART when initialization succeeds and uses DBCN
   only if there is no usable UART. Each DBCN write is an SBI ecall,
   which is slower than an MMIO UART store, so the fast path should
   stay on UART when one is present. Guests without an MMIO UART still
   print via DBCN.

2. SBI_010 version comparison (patch 9)

   The review asked to compare (ret.value & SBI_SPEC_VERSION_MASK)
   against sbi_mk_version(2, 0). The test already decodes major and
   minor for the report string, so it compares
   sbi_mk_version(major, minor) instead. That drops the reserved bit
   the same way and avoids encoding the version a second time.

3. SBI_040 / SBI_050 IMSIC check (patch 9)

   v2 parsed DT/ACPI on every call, and the review asked to cache
   all_harts_have_imsic(). After patch 8 the check is a walk of
   cpus[].isa and cpus[].imsic_pa, so the two tests keep their own
   loops rather than sharing a cached helper.

Tested with QEMU virt:

  ./configure --arch=riscv64 \
              --cross-prefix=riscv64-linux-gnu- \
              --console=sbi --enable-efi && make

  EFI_USE_ACPI=y EFI_UEFI=/path/to/RISCV_VIRT_CODE.fd \
    ./riscv/efi/run riscv/riscv-brs.efi

[1] https://github.com/riscv-non-isa/riscv-brs
[2] https://lore.kernel.org/all/20261120135613.1388647-1-andrew.jones@linux.dev/


Xiang W (9):
  riscv: Initialize the ACPI RSDP from the EFI system table
  riscv: Add ACPI support for CPU initialization
  riscv: Add ACPI support for timer frequency discovery
  riscv: Add ACPI support for ISA string discovery
  riscv: Fall back to SBI DBCN when no UART is available
  riscv: efi: Allow ACPI boots
  riscv: Initialize ISA extensions for all harts at CPU setup
  riscv: Capture IMSIC addresses at boot time
  riscv: Add BRS SBI requirement tests

 lib/acpi.h                |  64 ++++++++++++-
 lib/riscv/asm/imsic.h     |   8 ++
 lib/riscv/asm/isa.h       |   3 +
 lib/riscv/asm/processor.h |   2 +
 lib/riscv/asm/sbi.h       |   8 +-
 lib/riscv/imsic.c         |  86 +++++++++++++++++
 lib/riscv/io.c            |  52 +++++++----
 lib/riscv/isa.c           |  96 ++++++++++++++++---
 lib/riscv/processor.c     |   1 -
 lib/riscv/setup.c         |  71 ++++++++++++++
 lib/riscv/timer.c         |  35 ++++---
 riscv/Makefile            |   2 +
 riscv/efi/run             |   5 -
 riscv/riscv-brs.c         | 192 ++++++++++++++++++++++++++++++++++++++
 riscv/unittests.cfg       |   4 +
 15 files changed, 577 insertions(+), 52 deletions(-)
 create mode 100644 lib/riscv/asm/imsic.h
 create mode 100644 lib/riscv/imsic.c
 create mode 100644 riscv/riscv-brs.c

-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
