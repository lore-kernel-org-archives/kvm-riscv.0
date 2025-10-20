Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109E2CCD193
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ljV2P5IS9y4u6MwhKf2AImfOSL6bKmdVTLkpNQbedyI=; b=prkQwPu2w8Q2c7
	BSFCJAFuoty87eYBX4xxc7+I//woK/gXp2P8Jt/K2hdK3s44B/n/muzCDCrUt5Wp0QE0uCG0TVi39
	LuGyT7W3rrONvNDE8uYiLva7cs2JqU+hRZfxSA3FdwvSwDKX1GJuUnwQ21QttXvnVcX2JFYTctMNe
	AnZiZdS0xGusiEY/rPVphUjJVfQ3jfHMloTArH6XKuYXgnfSxDBSqXTTg4v5/liB7susXjceBz/Am
	ml5b+VSkOxnMehbKa3zJ5wLgxOfR6p8odXwM5L/sVf0Ulh22kRYgK08P9bk9qBgRVZCR0W8HZ//6Y
	LV/ZjfzDWBOXd8O6dhLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOY-0000000Bpdb-2ICp;
	Mon, 20 Oct 2025 04:21:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOU-0000000Bpc9-2vMO
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-269af38418aso46475865ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934070; x=1761538870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=conQFyh0ywHaD293wZYZONSgw/GLLJWk5gnj1mP84r4=;
        b=KhqsmZIJ8Fwfh9zA1wWStK3DEaayYO7gIhW+6dVFniogL2Ig0FThfFfshIeAVVeUNE
         0piEDePLdH9InQEIsPApnrs2Y+48adL9FxKQX/VTjebZL0jgS3v6/CGAZ9+n7xm0Bc2V
         T+ZZiK57LMjVFbqUln0aFQNOELixlLdD+Zd9VRweHCx4FMvgI4NBk75WvLQ2N42DwR3s
         RK3N3ItWWFFYENBjeumBSprQtbWanMthIHtoVx7TMd3zfPBxFhsoJsHzoUi0JE/GTOA0
         8uLRs9X8fhMdtXQ4zOUkSsHahwgwWaDM6W2VAkAc654UgHYMr0qbxWV+tWOabCagVLwg
         D0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934070; x=1761538870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=conQFyh0ywHaD293wZYZONSgw/GLLJWk5gnj1mP84r4=;
        b=mfOyGTAOxSuPscvq8sOl7OZJN0SMWTSz0Z0vHCv1gea9honbhMSSHZ4CdNuDvxeAUn
         nYqwuAtl6jfYoxdwsvEAlYo0satb/8NZVzsTAXaMoT44jhkESh1E4xyGiRtO+3YlsNhS
         r21sXVFtwORF4oV5ObiAb3/TiHHJYT1/m5hfh8qC2JPOytOsVMmp544MkG6nC3v9RPga
         WOsItkdRTpSQlrh9FG1zipoWmqc1ytcnKO1RfW9w4MM5OhQeCivSPEYOTG3mKrwiGxTq
         bbESvztN/H4q3Yal0QdxeFngXrDcv8Oga72mGGimZER37u7pLPl1mG//10+1YtC2pxBV
         QkPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJcAf7DF7rZq/fS6zTT4kkCGjq0ZloRoaIzjrxZG8uT1+IsYuCH0gC1LTeFT7F7XoeCS8WT+kGv9o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzI4hru8oQ/8cMkr4hOkPQlAcqW2OduQYvD1atuMCRObPmRbMbu
	z5RIEEBEwFzQES+LiuFP9lVEfKj/YmI3OyUfT1isIPvl8x2L6yjHQ4x4uQMhn8ocgsk=
X-Gm-Gg: ASbGncuhQzR0T6JAo59uCZ2eGZP9+90C+sLTh5aLJezCoxr6bHFC8e3lL7cn7OlZ6hr
	AUSOYhs7I4M/GdkViztuvJ6LqT2ShON1mLcdHUtmJrlwihlIt2spco2HBrfV6Y350gi/3cHkM/h
	AGZD1H304K9aG+6aXkiCOl6sV35Ctnpc/nUySQtj4z/1X8NmdeyvsUVpiJNKxse23Z7+JZZAiAd
	uLidnHAXOu1VPF8PtYqlfWTs+9AlJ/26B9aZpHDv/8pqeiloYaV6K23KzxZKeJbqPh1J4C7I0RK
	xvGK25h212U4oJ0leR+vHAWr1BZ76+EnjY1uZ2+y63whMQAhc4IqI5EfhebcQ0U9/5wHwe1DuLf
	E/Dme3j14kxTyl1AoXpTjMcS0PQy9hXGF9hfsdqwtUa270Sk0Oe+Nix/PbMFzanv7cDCFQLOpDG
	6qrCL4NCExtndA4RhD3dAKSFW1O/PMVGO6kwee8j07jyp7QCVxEcFvJT0LbaEwPWpHXH7NUFJgW
	Q==
X-Google-Smtp-Source: AGHT+IEdkgCehFcbIRaUApmCfafCEhZVkAa78hZZpBjec5gPS2C5TVHNU0zWNgu3Z2IjgaK3I7rtpw==
X-Received: by 2002:a17:902:f687:b0:26e:49e3:55f1 with SMTP id d9443c01a7336-290c9cbc867mr157233355ad.18.1760934069971;
        Sun, 19 Oct 2025 21:21:09 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:09 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
Date: Mon, 20 Oct 2025 12:20:46 +0800
Message-ID: <20251020042056.30283-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212115_022085_EFB17170 
X-CRM114-Status: UNSURE (   9.54  )
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

This patch adds support for the Zalasr ISA extension, which supplies the
real load acquire/store release instructions.

The specification can be found here:
https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc

This patch seires has been tested with ltp on Qemu with Brensan's zalasr
support patch[1].

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

[1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/

v4:
 - Apply acquire/release semantics to arch_atomic operations. Thanks
 to Andrea.

v3:
 - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
 so as to ensure FENCE.TSO ordering between operations which precede the
 UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
 to Andrea.
 - Support hwprobe of Zalasr.
 - Allow Zalasr extensions for Guest/VM.

v2:
 - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
 Conor.

Xu Lu (10):
  riscv: Add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: hwprobe: Export Zalasr extension
  riscv: Introduce Zalasr instructions
  riscv: Apply Zalasr to smp_load_acquire/smp_store_release
  riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
    operations
  riscv: Apply acquire/release semantics to arch_atomic operations
  riscv: Remove arch specific __atomic_acquire/release_fence
  RISC-V: KVM: Allow Zalasr extensions for Guest/VM
  RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   5 +-
 .../devicetree/bindings/riscv/extensions.yaml |   5 +
 arch/riscv/include/asm/atomic.h               |  70 ++++++++-
 arch/riscv/include/asm/barrier.h              |  91 +++++++++--
 arch/riscv/include/asm/cmpxchg.h              | 144 +++++++++---------
 arch/riscv/include/asm/fence.h                |   4 -
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   1 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |   1 +
 arch/riscv/kvm/vcpu_onereg.c                  |   2 +
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +
 14 files changed, 314 insertions(+), 95 deletions(-)

-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
