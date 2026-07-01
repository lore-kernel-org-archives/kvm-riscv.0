Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F92FC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eoTiSrrp82bvMZ6+qp1drg0TPGAzZ+Z/CokgWUyo6mA=; b=lU+OjXVYU4t4Ge
	OZsOUxbp2Jgne3m56aG7qKyWjyLcyPfdtpYTSSRKtDyKs3+dVHlbatvaNF46LnbJHIFR2DIqCv+oX
	77n0PSA2EhGlTAlkZuKUj7IkHR3pE3qm0tujFyVHNt79boCjoj8jTSg1L35c+uNyohoox07JR6+iG
	EoImUNf4kYjfhjNkgB+qPXaOLfhQrg91Avy2qN6TfRpKPn/ONYB7kVv0eIliJEI2V9s+TVilzla1f
	uWqRg/S6TsgRBXOcjzXrIK8YQ/poa485nFRJN0xoXYAqCq42WRfjI76TOnarTf0lQGhoeP8yBw5c4
	atHawivmzohuzOZjMe5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNA-00000000Ukl-2sFR;
	Wed, 01 Jul 2026 02:08:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekN6-00000000UjT-2Jej
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:18 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84794e800f4so85768b3a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871695; x=1783476495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYGKv1GijZbzS2DhKVzIdX99psuP24mkJom0bNyiTH8=;
        b=QvsBmrdQgz+dW22VMpsxcasl7ByMQSjai7SR5fcNQTud1sBVjXQjpN6zug5A8hwfMZ
         1eGimwlm9oMEhtGJBAqOGOSFZ3pAhaT45dAWQj3mfQGQmtSfSeCwtDk4esbqmwLM3ivu
         fyf24pGRZqLFtJt3RNxKOVurbBzQ21Z4tRRFdl2l1+uQ+QvTXSBSYQrOp/gO+/RX7PKt
         DaKuAbi8UR3nbt6yNe6rOcdi3EzIBcV1/w6t/UQPQ66Im4lI0g5GAdCDyz6eEXt1M+mE
         UThf/hkwvwOYBUbIaTI+Rwu2aqGxAVycQsasSR6m273EyKZRptbogAXFua+TT8pkb07c
         jykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871695; x=1783476495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYGKv1GijZbzS2DhKVzIdX99psuP24mkJom0bNyiTH8=;
        b=H18GXKBBGtkAo8OiqQO2N6hIKparuyL0fEP/A/5vVNv6ItwQLoRJdglvrHuHv6bItL
         BTrWiAG5revO0BedDLWxn836KfHKlINdfdUENG8/DPM+3Tw5Dycm+eSkEtwUx2R/4SZP
         qbr4hAnp+nUZe8gPBypDuYuTObP14sY4C8JetIS6SwJ9ILFq/0pXvOg4bCS+3MDWGw+Y
         lCwlWoj5gGbZgu3aIFwhnMFmnKnQbBkzfhYJ4r2gSZcE1LmTLikqGTGqVEunAz1tig33
         +nibdwnNc9wl9ZGleW2sLS+vqI4IkB44oHsuD3NBagGobToEIURebUZ1PMP+2yiYAuuC
         ti5w==
X-Forwarded-Encrypted: i=1; AHgh+Ro3PlKIdJq35zdThGTmTrDuaOpbzCs7fRt9Sliq3yHgR/3+qkeQQHg2Hxzlo6LjjFdR5FkPo81Dg9E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9FyRDL4xZ/hjnc6BGFGh2sZH1yfH+7pIkeptDr770jKDkbpVr
	eCiYShmXtQYpK7tlYWai/0Rv+k8+2NAi135lAxiySO0Bx5/buOIu+WjDW9CGvA==
X-Gm-Gg: AfdE7cmdxu1QACMKPFXrG2Jo0WTHPZhdh1fsS9jfgKF7CWUbeTIHNugCu0R5sDZlA9f
	x8Bt4IPmH9a3CMww4D9ZjoqIrdI/2S7DRJMoXXuPsUOAmYqimZE4RgHrAa9Fw6+2id+/x0x8k8p
	KRkv3McBT0umj7VhMNBviuXdclzHEX6UatNNVuNuF9mJTMPRsa753EpNFMSWNSX9i+8Swf8F8MK
	O6byK2W/OVyxaGm2UhFcd5guuUEuJZ+miU6khQux5/bzK+j/IWzZz6M3930cWsLotcgGA6rbqoO
	OORXeck6x5YFLsX0b20ag1nOZuZj985IqY1ZafYvZ4JsuFofe6ymULpRq8et58L9mArNmgtvQUJ
	h8VHrh9F9pv2+eSYNHQRVt3RNN8bm4uLKC4LO2JqSmtMfTkPsP1Ev/TJ405jfrhOebbJoITERyQ
	B5zhxFnpQH9i8=
X-Received: by 2002:a05:6a00:3d4e:b0:845:d285:3b6a with SMTP id d2e1a72fcca58-8479f29540cmr5346223b3a.54.1782871694775;
        Tue, 30 Jun 2026 19:08:14 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479fff4c7csm3072923b3a.16.2026.06.30.19.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/8] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Wed,  1 Jul 2026 10:07:37 +0800
Message-ID: <20260701020746.170157-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190816_624322_7123EFE1 
X-CRM114-Status: GOOD (  10.85  )
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
 arch/riscv/kvm/vcpu.c                         |   6 +
 arch/riscv/kvm/vcpu_exit.c                    |  10 +
 arch/riscv/kvm/vcpu_onereg.c                  |  66 ++++++-
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 182 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  88 +++++++++
 9 files changed, 373 insertions(+), 2 deletions(-)

--
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
