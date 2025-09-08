Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9B6CA101F
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 01:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hIRIjLR55A5/kqBDl7LCT97dx1nYu/GEtzQLT+/Q/2w=; b=IC+IkW6qfOepTF
	0T665R+bsjmUrE9ANwTqrz0ojE4HHJQb4t0kPwCiJqZoHLyIwBNKBbfGfZug3JS3mbzx9Q+WeHhDV
	600UZKpMXEI16upcG3LbwbSoAuNIFW7+wMzoL15cFhccdQCw9+oSTiXNCeTLyAg1zAoKHgbkKlGeD
	3esnXtBZ3A+G4NAEDaXxi42IbR4kKdZWB7KsFRquOPZW/DV5QvjvuJrClU1ExHmf1pl5IEg/pSHq/
	ogecpOrr18eO2dPgwh68pALmfeMkmp/Krp6gf4SjaW2vwfbw9PKcJQ37T/5Hda+LHyrVIXIz9wfK/
	0PgENFzPaqK/lNRtH+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQL8-0000000Dgl5-3Pmx;
	Mon, 08 Sep 2025 01:06:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQL6-0000000Dgjg-2XlB
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 01:06:37 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b475dfb4f42so2257884a12.0
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Sep 2025 18:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757293595; x=1757898395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x52qenm9MurOag/X/RQfSuUteyrVwLaCULCgBiyHGAM=;
        b=kA8Zyyi3HDmfRmEPpkY9wNh02SNmueWiaSK0MsADeu6MQZz8gNDIrRrqrE+3OE1Kr4
         ZjZvKhSY8nffiKPY9FTOOMe3sfOgi0tSYey5UeSHI36SoNVzLTpQlHxnIvlRDu/jNUkV
         //4bnPmvD17AjerTsNvvFrrH0QA1QFEKTcanmH8PFbKMp3GQWwTwXUVB8u96GkysGQsZ
         nP/tXCe0e2YnSOlb3oxfzbsfXaF5U9TUNX35X5vuNQ1xUjPWoX09u5FPqVQwjrKtVfoG
         5yByLB6rWSry3PeTFeGVQgoGc/6of/7EYOPdtlHf5WlSEfX1WDkpDWcMLaIgqN5sURhk
         Gjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757293595; x=1757898395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x52qenm9MurOag/X/RQfSuUteyrVwLaCULCgBiyHGAM=;
        b=OunqwrX54NwrWo/D+l8Y+QJVQORC/x2ksXB3Qxve89TTCoV6th20Zf7gSAalIimjWx
         MDdLXP/C6V5B3bgUc2GHgw8Q8x92GEYyM/WPzWBzD5BD0ZGt2NZW5Q7QWBat30jx7zrj
         gCYAemov7VTigupQ5kgym/MjjnFw6ACHNqlNXQ3gp/cFVnq03VDtyL8XagP4VHaxPWMX
         kq5p9EEPWcV2pF4YpMo1ibabv6cUUfyzYhjgxmPATanw5o7C35Pvs6WMFVIOjBpO8gT5
         bJAb7g2Lz3A6rnl3pJM+AursVknDTJ7gdtJVnqQ+xFEMU2ZH8iFdYul+bjnQXARbntfL
         VI0A==
X-Forwarded-Encrypted: i=1; AJvYcCVitGyITipanrRSS00iGX/52F142PUXMwkE5OWgfCnhJvCCwozj0qJBuzopNswz0X8c/zDMZ6bQ5Ps=@lists.infradead.org
X-Gm-Message-State: AOJu0YzD93XOZMs6Lb6n3iEJ/yDFxg8n3iybVIMI1jGfTBVmECX0exLy
	MjxjxY0h/Pd993FNBl/YoEFRjsbSusp1KvYlRwgBPb7FTayOxUweGSeG
X-Gm-Gg: ASbGncv5RJ+i3SjVy5S86jC3xL/AhLK8wHeyl+BptogUI9z9XI+ZQJF0mD9g6wBGbP4
	e8FEzkC0yqWMRNgns1f3UfxCyiLRkfQV0VBUQHHk4narnpeTL9fd4mNFkXUEFZXrSUdrChBOsu+
	4/5gnzrFlkEhOsipQE/6kAPMLmlcTWHU8be7l6wCrCt965SIEb5rPLZiSfVM1sz/fZjTqKltcGe
	OqWj/tGRLvKLK9Lsu4ye8o++lGn8ku+u5sTlSo94uwk8ZH6lW5Kuw5hITXEF41PKovMCGYg1ypu
	pSdtMr5Icx6QUTwGjH/bCmw8Gm6dIkQhNptNOMEKObCIXzaq5mSzKFRz6MVHw9Cq7fY0DHB7nOs
	0Qmm1Rh1fLDMEnTZWMbvOpTXipKdXsDMWMR1pXv/unKLFDHfEIofc8ccSd/tat0eg2eoYgW3Po3
	hSFxE=
X-Google-Smtp-Source: AGHT+IGhd+DSL/YzHjcZM4C5VoWFKFpV0K7Mf8VKBLu8L5Kvg9oYpegFik4oLq3/jvMoCMPyPXR8JA==
X-Received: by 2002:a17:902:ec8f:b0:24c:ccc2:af36 with SMTP id d9443c01a7336-251715f34efmr75961665ad.35.1757293595122;
        Sun, 07 Sep 2025 18:06:35 -0700 (PDT)
Received: from lima-default (123.253.189.97.qld.leaptel.network. [123.253.189.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25125d76218sm49507775ad.119.2025.09.07.18.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 18:06:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Shaoqin Huang <shahuang@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	kvm-riscv@lists.infradead.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] build: work around secondary expansion limitation with some Make versions
Date: Mon,  8 Sep 2025 11:06:17 +1000
Message-ID: <20250908010618.440178-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_180636_648089_99B8DE07 
X-CRM114-Status: UNSURE (   8.30  )
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

GNU Make 4.2.1 as shipped in Ubuntu 20.04 has a problem with secondary
expansion and variable names containing the '/' character. Make 4.3 and
4.4 don't have the problem.

Instead of using the variable name from riscv/sbi-deps and matching it
from the riscv/sbi.* target name, name the variable sbi-deps and match
it by stripping the riscv/ directory name off the riscv/sbi.* target
name.

Reported-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 riscv/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/riscv/Makefile b/riscv/Makefile
index beaeaefa..64720c38 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -18,12 +18,12 @@ tests += $(TEST_DIR)/isa-dbltrp.$(exe)
 
 all: $(tests)
 
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
-$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
+sbi-deps += $(TEST_DIR)/sbi-asm.o
+sbi-deps += $(TEST_DIR)/sbi-dbtr.o
+sbi-deps += $(TEST_DIR)/sbi-fwft.o
+sbi-deps += $(TEST_DIR)/sbi-sse.o
 
-all_deps += $($(TEST_DIR)/sbi-deps)
+all_deps += $(sbi-deps)
 
 # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on QEMU
 $(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
@@ -113,7 +113,7 @@ cflatobjs += lib/efi.o
 .PRECIOUS: %.so
 
 %.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
-%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o $$($$*-deps)
+%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o $$($$(notdir $$*)-deps)
 	$(LD) $(EFI_LDFLAGS) -o $@ -T $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds \
 		$(filter %.o, $^) $(FLATLIBS) $(EFI_LIBS)
 
@@ -129,7 +129,7 @@ cflatobjs += lib/efi.o
 		-O binary $^ $@
 else
 %.elf: LDFLAGS += -pie -n -z notext
-%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o $$($$*-deps)
+%.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o $$($$(notdir $$*)-deps)
 	$(LD) $(LDFLAGS) -o $@ -T $(SRCDIR)/riscv/flat.lds \
 		$(filter %.o, $^) $(FLATLIBS)
 	@chmod a-x $@
-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
