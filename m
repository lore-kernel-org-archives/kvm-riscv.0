Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CFCC43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EUxX1Bs2VfLOtn88sGWGIUON8HMNfJQY+I1WRghVkqY=; b=QwcpgvQUvMWInr
	g4S0f69zwnErILuHFRCe8OPhP2BiJ9XDZ8Sz/zFKtxhhxuvNW4oRMZM0oCg+2LvpaxESzVcJN5B54
	MSgyCy4ZjRsIT5y5ndr+OijjDnbKKj3w5AQ9FkjzO4zpK8T2FKi+qDqxdbV6Ojs4624BWTGi7BCeu
	q1fns5W/oq8HKfgDN+tC0F+9Y+OuyFdJfUcfb9pCYGYaKDekZBMkmgsQ/TAFqkmMg/OLR++W6TQcN
	yHrbT78RnMOphWJ+Foj3cqmS8rQCWgTj7wQ5u3rYE0dRDN72aMhgsOtQt05sygu3KK4fLXsXSNOrp
	TYlgKRHuvwqkvKkMJcvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxj-0000000BNMp-3Fnf;
	Mon, 06 Jul 2026 02:21:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxg-0000000BNLC-43Ir
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1339576a12.0
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304492; x=1783909292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blzW8cj7qixZrZx8HMTc8WTCaoiy272JiHUFbPafbvA=;
        b=hpQ7yCuCtiFCCidHDhLN9O7iob/WBepn8Qp56+MryZPvJsShtNJY7gb/y5RCHcLMHn
         HZLbFIgy0AfHroYFV/tIT5DZz3y6MlEDLP41LWjeb844IzkrgHNTjYhUP6iIEkG5/M+J
         NJOS/ddeIfjNrc+cUoIy/xtsXkcVAaj6yQIMeXmBEKitf/0Y1c1F+LqznQRehBmNZZek
         i4amdCUNLpr3JW3aDk/MfTJ+Gc/dhq8POinXcSdcPyoP8Nsd+yMMINsSbKd5VWgeieFT
         Q3/ia50RueE0DaVPgbi1bakfAhz0EssiaRWYNphjvUYG3qI42nvDf+yWdv7SgeGqQu7d
         otFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304492; x=1783909292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blzW8cj7qixZrZx8HMTc8WTCaoiy272JiHUFbPafbvA=;
        b=d7SAiRMqF2gKatvx9/9L9UtgKCnnEQuZU6H6qcinV2UORwWMFSSLfm81fKbr3i5Zwe
         ossDtfbkIzYUAT1CzaLgEyy56RPrLwHbS5WurVOtUzN7OokFHWHAcqGBx7AgQQMqpLol
         VSC3Iz+QewYCMwWyGXchf0L1qIl/zu9orcMCEpwGGazhDjD/wt7MQJyjLmuEBdHwK4n6
         KM1VD/9GWyecK0LWIHaOjBJr/L/oPY5wqza6KC2maH8+HQkthxYh8YR9ltMd+8LC9EY5
         UdDKA800b7G7Zl96hOEdIGJE7aCxMABWWUGj+61yrA+TxUONjlH1AtQrIroq56q725eF
         YS7A==
X-Forwarded-Encrypted: i=1; AHgh+RpfnodXYi6KMXOZ/FIUCQ82y3cIdw/6Nfh/1cVGrmSchrZmPBJ0ZF5/YJNXeIJ3i+ewIG8kShjxtXo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXG0/27wnT/Ae31RtcrQCFtVzyhOAaoq6MUGjihaSGdaSKWhCD
	E93JtNUjLLcWHO2x8gdvnP8lOzqae3U0i32MMYDYiWAlV4Y4U8k6AMUt
X-Gm-Gg: AfdE7clPZzhaBl4IYx/U8dhFzI3m7lgM/eBThpAXiHuwr4TFy+akmEMAzxD9fJk2RqT
	1EjcI6nIZSvu6OLLMJVwLfXsJCKwpOjja/MSSebjOadNcccxlxROBdO5WcpjtIXtkUHq/rDmO1l
	C2ra+BgNL83q6G+YzKG9SGj3uf4EwnYTXRAp/FzDF7Q4vZIgzKPSxBW6MCPR/9kP5+HkjJSkq5e
	9iP+FpxUSYYiRHucfv3Eiy9HJVtN44i56jjcuzY9oO5VYQOfuV1dWzUqJlDrL4+ypU7cBe356zY
	clP0YuBcpw2FEOkSpr9DO+kt25zVF5zDfbjB2XwnDj8ZzxMW+QI4/rjgzoNxO0k5w5tAXCf3Wiu
	HEQcmwhFdC5q7pDRi8iD4KSm1zgotzBkLUq1QaVNgI5cr+/8cYDSuF3siLkqneyZb
X-Received: by 2002:a17:90a:d40c:b0:37f:f089:c81b with SMTP id 98e67ed59e1d1-383394cf557mr5675419a91.3.1783304492074;
        Sun, 05 Jul 2026 19:21:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38146b8d314sm3764140a91.15.2026.07.05.19.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/8] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Mon,  6 Jul 2026 10:20:36 +0800
Message-ID: <20260706022046.214956-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192133_010296_7554B9A4 
X-CRM114-Status: GOOD (  12.01  )
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

Changed from v4:
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
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 184 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  90 +++++++++
 9 files changed, 381 insertions(+), 2 deletions(-)

--
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
