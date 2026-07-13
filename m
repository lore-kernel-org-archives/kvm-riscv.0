Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF484C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j0v/RGxtzRTYVoK5hAMGdTpDs5wvUuF0xkSlBbF4Lcs=; b=WzU5dtekzRq7Uu
	kBN43KscNuFLof8PNqvAODLyrEj2q5peCjTBwEpZSu/r5fziGQ6EDAS7g4Jczx68QPF0FV1AbKDBv
	Pvg5uniJARQrBRafEA5PyL2Wr/Ppu5Cjrr9f1MAvtVhhHydXmUpLhstLzi73YWRVlMaEu4IoePYt2
	TIuDVn1qP/uE1Ddpa0sdLyuT4QslggC557xJNxArUypPlKrZDK9FZZH9UBESgF0b1O7rE2sSlYbfR
	nT+euvJLq0XvHMPdOq+Gm+gh4iPtGvPkQP6nwNzA0aXW8r/4B5Lf0369wiV0ifXHfJQJGLcLGwbnw
	L0kN1Lx5fPjzVonoLDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55M-00000007tUC-1iEh;
	Mon, 13 Jul 2026 01:03:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55J-00000007tTF-2OIv
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:03:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-842338c18e0so1996859b3a.1
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904629; x=1784509429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHNlMRDMMMe/DeM+KYptR6x1Xol+X7QDPM1SwrT/UAU=;
        b=QicWshbCVLWfa294Q9J2o0omrCEfZlCR96VauHrRV84Q3aOMdldm/ly9PZ0ys7pdbD
         bdcMli2doDy6o1W54QwlskquYd45WlmuOi7nsS4vmG0twWkdHVaMeUVjpvf+R2VbzRmV
         WOC4No2HxC3ecHHIaTsEEn7JgWinmsJSGNve3sdwD8uMlA6oIcXYTiViii/9wwtpOpz5
         bWYvK1B1af8d5nDP+v6/KKkboIkqo/4fwegkayEzbAYv6xftcWW3BZQMedWO6CstIl1e
         z7BM+/63B6oVRGGMmDWIhXgDgYW05lfUZyHO7yHEabPKLOcjA2m7at1I6CqcLKQghujt
         aOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904629; x=1784509429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHNlMRDMMMe/DeM+KYptR6x1Xol+X7QDPM1SwrT/UAU=;
        b=saajentNmMlH1P4eSY9DOahCDdTwKt3KX8YIxVe81gmNCXBI1+gEo+2q2tX4NXVph7
         IqoEEb/GAUoYVps+6FUYLPg9ypGVuvag81MYlUsW3T4Lvrb5p4NPr7BbtTUewfpXVhaU
         NkUuA38VxHGoYPynahAQNU5kdPysx4A4b5XLkKDVaD+jx7Wb6o6Habc2Z5z67+V9m0pM
         lFdDobv/Fm3fi0xA06H1my3rzRc9I2EpRBH1rZpHdhIGIPuAhXgGThDcCDg39U57VN5+
         oBmYX5sh5J4J0mOxeXuZoEd0lhCdImyrm5ne2iNHI6rg3PPXl3uQmuPB+ulWZ02CyR7Y
         uN0A==
X-Forwarded-Encrypted: i=1; AHgh+Rogs2dX3sgV/6FufvL5gTmAP7Oq7OaY+LOcjCsAlwTWqpDECmlyyQXJk1VdKxcLIUU+O7hpQEBTI1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd1viRiava3D9126M+a1XyD8Z83CAZzj7r27Lf9c+3V2eM+hdC
	gmFQFJnJ0hWWHxDBJNpjCkFllGDiuvFSiI9o0DPXFWISb7mbz6bKpYSj
X-Gm-Gg: AfdE7cnCVa4M8qlLThV1De3J5PB6JGCHo8BXQJveezCT1mA8De/W6FDdW54FOaC7uid
	wUQpYy2ZHl78ASfXXrX9bLpzWb92LDIMrEfs0rKYCjtVhbDQdIqj1orgscC71EFlEPJwGVOc8Td
	etatfWFyOnHHNRdf5qJ7VVJoeVU0vbs9gKH/WAO8irt7KZrFUNVhY38Q/fnEKa0cCD9kUgcAGaa
	to2zuNlptep3sIWkJHbjkw2gw0XoHdBOR5jAMw199z4JBVnoM/TPVKFNPIa6/nCZOgzr++fwqQO
	DV5IOCfO8nrVql8y0cIgRnqD8VBBm1YBtNuJYDyFNp13dSTBxWF25W3vNQOa7Y+hJSLYrIeqZ5I
	+Yi9cUi9TONdk+a5FXaodMrGmwv5sg+KMNbHBuNgFLVboLJa4ulB45AfjQMkmnF4/B0WUqUwWpu
	I=
X-Received: by 2002:a05:6a00:4fc4:b0:847:7f6a:c56d with SMTP id d2e1a72fcca58-8488967b436mr6947225b3a.30.1783904628530;
        Sun, 12 Jul 2026 18:03:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84909673e32sm2292135b3a.56.2026.07.12.18.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 0/8] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Mon, 13 Jul 2026 09:02:53 +0800
Message-ID: <20260713010302.303278-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180349_648573_4E5F8232 
X-CRM114-Status: GOOD (  12.89  )
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

This patchset based on the patchset "RISC-V: KVM: Add Zicfiss/Zicfilp
support".

The patch includes all the function of original patchset from Quan:
adding the Svadu/Zicfiss/Zicfilp FWFT for the RISC-V KVM. And this
patchset already passes the KVM unit test.

Test with the patch applied
https://lore.kernel.org/all/20260618064406.14508-1-cuiyunhui@bytedance.com/

Changed from v5:
- https://lore.kernel.org/kvm/20260706022046.214956-1-inochiama@gmail.com/
patch 1, 5:
1. Switch to csr_read()/csr_write() to update csr
patch 8:
1. Fix the macro name.

Changed from v4:
- https://lore.kernel.org/kvm/20260701020746.170157-1-inochiama@gmail.com/
patch 1:
1. Use NACL for csr update
2. Check ISA mapping before cleaning the ADUE bit
patch 4:
1. Clear the zicfiss csr during a VCPU reset
2. Add zicfiss csr to num_csr_regs()
patch 6:
1. Cleanup SPELP after redirecting the trap
patch 7:
1. Use interrupt bit instead of number for masking/unmasking
patch 8:
1. Add missing entry for the test
2. Fix the wrong comment.

Changed from v3:
- https://lore.kernel.org/kvm/20260607081105.993908-1-inochiama@gmail.com/
1. rebase to the v7.2-rc1
2. Tested with the updated Svadu patch
3. Remove the dependency as it is already merged.

Changed from v2:
- https://lore.kernel.org/kvm/20260601084336.2601675-1-inochiama@gmail.com/
1. rebase with Yong-Xuan's patch set
2. Add SSP CSR context switch/set/get
3. Move the software-check exception set/unset into FWFT
4. Only delegate software-check exception when Zicfiss/Zicfilp is enabled.
5. Make KVM SBI_FWFT_PTE_AD_HW_UPDATING depends on both Svadu and Svade
   enabled.

Changed from Quan's v1:
- https://lore.kernel.org/kvm/cover.1764509485.git.zhouquan@iscas.ac.cn/
1. rebase to the latest master.
2. Split Svadu change as separate patch
3. Fix all build error from the original series
4. Remove the Svadu check in kvm_riscv_vcpu_config_ran_once() and in
   favor of the FWFT.
5. Remove the LPE/SSE setting bit in kvm_riscv_vcpu_config_ran_once()
   (kvm_riscv_vcpu_setup_config() in original patchset)

Inochi Amaoto (8):
  RISC-V: KVM: Add support for Svadu FWFT features
  KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
  RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
  RISC-V: KVM: Add ssp context save/restore
  RISC-V: KVM: Handle software-check exits for VCPU
  RISC-V: KVM: Delegate SPELP bit to VS/VU mode if landing pad is
    enabled.
  RISC-V: KVM: Add support for control-flow integrity FWFT features
  KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list
    test

 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/asm/kvm_host.h             |   7 +
 arch/riscv/include/uapi/asm/kvm.h             |  13 ++
 arch/riscv/kvm/isa.c                          |   2 +
 arch/riscv/kvm/vcpu.c                         |   7 +
 arch/riscv/kvm/vcpu_exit.c                    |  11 ++
 arch/riscv/kvm/vcpu_onereg.c                  |  68 ++++++-
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 183 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  90 +++++++++
 9 files changed, 380 insertions(+), 2 deletions(-)

--
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
