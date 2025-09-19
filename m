Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C9CCAC592
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ymP1oWuN3rGoPNImTXCuCimysMQN/iUImpzO1eUMfU=; b=RJ2JoiFbRnCprp
	idP9p3mVVvlHK1TezqACkXz5L8lt/jyylFBa0SFojxFp2qWUMVXsiqt8uXln0vNGPtpu4PLFi619B
	pReDxFk+ssPMIa728x3ZCos+O/g1Ko57RN75y0i5XrOewoAWgq1P6YawRn0gEeGqtkMo649OG6h+p
	c2k8eNwhyYyyZdoA4VcPdQZHqJRhSpozHkC3dHNEd23plq5cuLzD2uEK9F939v9dwzGd+FInLsWqo
	2ZeRaiy3EuGjwpc+33oAOP3/aUaLC1ZzWUZCoA4jB35BJInkanPx6pAntkpNWHR4xEzm2e//R5zXu
	tDXeAw0d8UmaoThGODwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgT-000000025Dj-1pZc;
	Fri, 19 Sep 2025 07:37:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgR-000000025C6-19JO
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:37:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7761578340dso2486503b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267449; x=1758872249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQi8kkf+E11TPqHviak6Q179Pwf94vhIPRCTAWlGN3c=;
        b=Nt9U9R4JqfMlrzoWM1xn9yGioyHkAPiizeQ3epFKxbz6q2+RdwpNw/DJBZSnXzPdic
         vmyeLYcCjeyP1ZMEjjXF14XzHC/ksMJ+KrU0mNXS4/tVMCFizAw+y0lsmjkQrqx28KAB
         N6QzTHzsClQQZ+PKXmX4fnvlv/Cjdz7iNRU/ZKbHDV9ZcCfpq90NYl/jwRCo2FXt2cP9
         orppQf6JoEjHdvzJR/kpoyeXdiz4Ov2YkDy+KmdUCyKdEFQjaXZTOl1kddyn/0ecMp8q
         IdpTcbk/13DH40NLxaT6uDKygg9ubLhwG1ZmAJQvJxuLa9xpP3dixc6VTkCxp57Vlo44
         2wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267449; x=1758872249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQi8kkf+E11TPqHviak6Q179Pwf94vhIPRCTAWlGN3c=;
        b=EjQpAVSL4DSHUUEg2oesFwzP7Px7yvgGEpyTq40xv3eAjZ81NKx68jgHII2JfYuC1S
         SVDPnONbDLi9+86g2p0SxZEa09S8pMglGbDeuVz/Yh/pan2zGoLIUAND7ha2Kp4xz87Z
         sIApsJ4/gQ4xI51wQWSo4OTRuy8RBPa0maxZiQjnpQFS6hY5y8Gd7EfABsjrvcBGK7IC
         tdKzd/RcB1WkmT7IgmKOlX9AIfvda6vmo+bgx1a6CByvKVkMf249yAQmBGga9D2fmMpU
         7dBpUje8eaeaYepbqGFk8hD43fDzFYlPFY5jRoT3EN3oVCCZwDRl/8ySbWsNWy/iUaK/
         Ynjw==
X-Forwarded-Encrypted: i=1; AJvYcCVPwt0YCCwub/Nz0NlbwXgKvfXN+Ax8DjOQXYs3b48sgYTDG5XeCqMvkG7NSIKxGI+Ed4UnvuTHAZk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXIfYfZJjnQu+Eb4yNDB/GNGMLAA+Xs/IxMAJNvxshlyQlivwQ
	PiAAdSNp56zdHil24Q2SexcpexgukInf50nN1PQVcIAoll1Zb8dCVxba7xNdkfibVlE=
X-Gm-Gg: ASbGncs/fIuDoYPk0jy+/TPoVAutHqxqdIPY5nQsJyQIpHTkO2YcofCh+gj/19lXT8f
	43Npte7OnKqfyGXM7/LLyD10H2op7wZH2243KxbHgPshpsGpSEQKxzOwGjtz2bPv/vtP7MjDiLH
	Y0w+5ZDTUi7pw51CRyED4lvwNUu8BAYPo0r1HASebL8bin/kZ/uYbojzGTZnnldGLbAX+MZ+2/V
	Euj/gveuKcoCAAXcZYQuAdfJeVKuZeonfgkrbBWdJM1cEwqBVT4xJ5CXfD7Z3nYA+/DUdFaIABc
	TWBXYA9rSTBCvQEepDRDN0kPfrzHbiUUhouj7SfUIC9knx784j2wjV70HuYN2QCH2VQq9Xtci3H
	0gCLelHDIisnIUTaNydzlgM+py+X0diPfVomkfeoWsS+Dk218tAdzig+p0dkXi4f8di24uamEO8
	4Is733nzVnr36Fj8XSlc6AU9367+5ANBNLZnwBeDD3lsHBH6NoJd8F
X-Google-Smtp-Source: AGHT+IGt4SFGJptpZ0jrCH0JCo7jlSYHb5iMvq47K6wOnBUV4fZAO0y+jOsnj2fzSLzf3+aWmVng0g==
X-Received: by 2002:a05:6a21:3294:b0:263:7cc6:1c3b with SMTP id adf61e73a8af0-29277cb8e9amr3774594637.60.1758267449202;
        Fri, 19 Sep 2025 00:37:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:28 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
Date: Fri, 19 Sep 2025 15:37:06 +0800
Message-ID: <20250919073714.83063-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003731_593091_AF9A738D 
X-CRM114-Status: UNSURE (   9.94  )
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

Xu Lu (8):
  riscv: add ISA extension parsing for Zalasr
  dt-bindings: riscv: Add Zalasr ISA extension description
  riscv: hwprobe: Export Zalasr extension
  riscv: Introduce Zalasr instructions
  riscv: Use Zalasr for smp_load_acquire/smp_store_release
  riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
    operations
  RISC-V: KVM: Allow Zalasr extensions for Guest/VM
  KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst          |   5 +-
 .../devicetree/bindings/riscv/extensions.yaml |   5 +
 arch/riscv/include/asm/atomic.h               |   6 -
 arch/riscv/include/asm/barrier.h              |  91 ++++++++++--
 arch/riscv/include/asm/cmpxchg.h              | 136 ++++++++----------
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   1 +
 arch/riscv/kernel/cpufeature.c                |   1 +
 arch/riscv/kernel/sys_hwprobe.c               |   1 +
 arch/riscv/kvm/vcpu_onereg.c                  |   2 +
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +
 13 files changed, 242 insertions(+), 91 deletions(-)

-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
