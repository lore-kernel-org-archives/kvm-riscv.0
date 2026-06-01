Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EA8CD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+wO3qZSkIE2wAUnlbkiB7tw1iv9slQTgpx8nNQweCc=; b=u1rZ4CXzMJGoHy
	c2UsFrQ6VqgStOnZc8zIOnvZbGJNYJJfwv19mLJTyrE3ULFCErnC2ySrDYWeAlUgBigQPu/04DxcI
	0d8YakC9qcy/xshTnNgx13CH1bl3tXoxD6kOJaWLbHf4r1xPOQ5uko3zBW050t3EUBoxYMh1/BSE/
	Yyu4ql4Ue/a6494ZJ0BsgvrbW85T2BR0p2Bbap6Ue9JF/6QkGeCmA034Y0KiBscqv8hxCg5aRneim
	tK3E29ePxfcdJosKhS1U/O3pBf7zBo6Pdyp4X03Ae482aQAb6BES8zXuc6qJLDwKoQmWqNFlTyLkt
	D6Pk8BQkrzDn7mL7zUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFa-0000000AO9V-2fpe;
	Mon, 01 Jun 2026 08:43:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFY-0000000AO8r-1mDb
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:43:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8423f236418so349208b3a.1
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303435; x=1780908235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bMOIBVqvBN09I3lKcw/r64Gz2Mu49nZfhySphfExOPY=;
        b=QuYUI3PXY4HOoELxreEmrTOC3BYWKRgNbyd72eALNq0/M+sjp3p7IdhsiJ0SyZ81kc
         LmTOQ7p8azo9hDHoAJKtxhJkz3XZpSMaHWOfEN4a2tMbXBNiRoj23hoztCDxAUamE2dm
         kDy4bgSbnu2hUVhnoslzDOCxjhnWTthtNOidi1VhmMGvyrsua9YXu2mODkL8ipQcOelR
         sUM4o+9j3qlKY7PmPcdlOPctFTmONltyu2/xau23lk4aWJqUv57g2EDRR/JLD/VQyLMS
         gqLZB+e8b5Ye/5eDVcrv2DwWMyYJnkEtmnhmSpO9lsYcgiV9K9aZPEUvMw3cmXXfFqDA
         smIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303435; x=1780908235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMOIBVqvBN09I3lKcw/r64Gz2Mu49nZfhySphfExOPY=;
        b=bjRan729BkIv5OXdqHLCmXtEjXOGbdwYT7lO5VVkFQvmQadIGAjimds+1Y4g7I9UJR
         4RNxg238iMbh8HQydz9zheypAQy77/RCd2wfgZ/oVGteY9nNWWYQu8Qf7UFsCC0mKljV
         VpZ3oUUs06mkd/tUKfEwWkG6a4SICxzO7qDFze7jj7PVDVM35QI46yZOlIxt8fNFb8sb
         nTaDDLGqi0iRVKMe/TOSPSXiuHPPDZwyfCx+S7gnNkE2uGWwMazOynNcjluv5patt81m
         lmpgCRAw3w3W0nX7QODzJgXd3ApuUgcp4jtxHw7P05T6Sxzgb/OwbbHL64EjwDV5oVYE
         anvw==
X-Forwarded-Encrypted: i=1; AFNElJ/D6VEjMDxCCNFtJMr7EQokrKFTzKl/ovQy6iVttEv5wH2xwiVFCgSx7sgR+4polZ7+oBm73f6pKwg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxA7N16KVlGkPrvGW8G3YVQFOJa91twE6YmNr8xE8gCkMnkUim2
	VnWYa+k27YdkC6NcRIqHlyAZ1tR5eM2iFMFYuzy3iMTgFyUgg/qOpu/y
X-Gm-Gg: Acq92OFdwKrHAFtF1ubjPfG5dO1pyCri/TSpyiyLu9jFMz7hBcyn/ggE55dgg1FUuP8
	IPHaREJFu5q9BqmNFQCIQWHOty1tDOmyVid25i3pxbU2o/cMAV8WIEtiR5oVqL+4nQtr93QPbew
	NmbqSZxepa8lC48d+9f3mirag3W4D5pp11CoWGgGeygT1xZOdfbEw3tpoBMxFBAETM0jxNJ8frH
	cssQn0QSQQz31ykt1sYhs0HwfL8d2DUAZ7vY11cPxBy3hdGW2ntM/UZbkoG6DwhmwfC0nQxSQ0c
	OF/RUK6yaVjt7yA63288SY++BGl0ciq/6vDcSK6dnd6tGKjIYzgLIvxbXdasmfd+TbgStnYmoSV
	Z4Dx6rTz+IGjlCyzI3hSMueVlzq7oPEquo9okvZ1+0iWA18AsDkOokshCXNuridBk1TDgD79iiK
	SIDqIVy0C4RiQ4xDeGFM0FYFHfUHsnly7PAQ==
X-Received: by 2002:a05:6a00:b50:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-8423aee3251mr6260126b3a.23.1780303435411;
        Mon, 01 Jun 2026 01:43:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423828159esm5376710b3a.35.2026.06.01.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:43:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/7] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Mon,  1 Jun 2026 16:43:28 +0800
Message-ID: <20260601084336.2601675-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014356_482581_A3F9F5CC 
X-CRM114-Status: GOOD (  10.05  )
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

Changed from Quan's v1:
- https://lore.kernel.org/kvm/cover.1764509485.git.zhouquan@iscas.ac.cn/
1. rebase to the latest master.
2. Split Svadu change as separate patch
3. Fix all build error from the original series
4. Remove the Svadu check in kvm_riscv_vcpu_config_ran_once() and in
   favor of the FWFT.
5. Remove the LPE/SSE setting bit in kvm_riscv_vcpu_config_ran_once()
   (kvm_riscv_vcpu_setup_config() in original patchset)

Inochi Amaoto (7):
  RISC-V: KVM: Add support for Svadu FWFT features
  KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
  RISC-V: KVM: Only enable Svadu extension when Guest/VM requests
  RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
  RISC-V: KVM: Handle software-check exits for VCPU
  RISC-V: KVM: Add support for control-flow integrity FWFT features
  KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list
    test

 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   5 +
 arch/riscv/kvm/isa.c                          |   2 +
 arch/riscv/kvm/vcpu_config.c                  |   8 +-
 arch/riscv/kvm/vcpu_exit.c                    |   3 +
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 142 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  22 +++
 7 files changed, 179 insertions(+), 4 deletions(-)

--
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
