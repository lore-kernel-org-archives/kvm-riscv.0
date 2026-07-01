Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34F5C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eBf5Ch3D6Sq9+PLBWi3nty8nYgMc4crP2IgrCdzFS68=; b=B4ixxat7WG0lIC
	WvnWJk5G3gMXj2lqA5xpCbtoLATb5/Pl6edZcuJPZ1HXTxAtm16rOfrgukUYJvR/ZpZODscO3iWbA
	1zlU3dqSnk+5wtBO3b4y1MPpcyrx77JSXWSII40tq/KqETHET/BEYbDCFeTW3cS83H5dcb6VlIANU
	mYaHj2EspzBb64J7rGoKaOLjZgh0nr2bbhgKSOtxx1RgPYfyFnxBuT2ZmUhjc4xPGMXuH2h15ZCM7
	E7StaIHw2HBEoqBRRxUtjKQlKqYLL2m92U5eavBYpnuABTgtG6MDwV6GUcxUIo8/7v5YVgJsHZFGX
	08lhzupsv8Ve6PTyExzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY4-00000001ECL-0l04;
	Wed, 01 Jul 2026 09:48:04 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werY1-00000001EAw-1pvU
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:48:02 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c96c92c0980so143483a12.3
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899280; x=1783504080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRpp8Aarym9MAbA9S6grsKajHp/qT3ZkQCLbPzfeNPY=;
        b=bM/RXe/rqoYrdT3abvdklMOx0RR2rM8mOi+lEsIOAujXVjA6o6fR2P5EiitJ1CnP7O
         s0/KWUN3tEGwEdE4xQn7UyEMx23jf/0CCciWHzCtB/5PDkY02+yUZvjKEazYydmvZeyb
         uDkjii8hC2Alwm13XAjZHybKqWq6dxxvEvgCxyBwtXvIxVJMqNJgTpgxEWc6jJgOrPx4
         b5mTikz4EJZLNPPDUR5ts7/qv9VQSf1gVZqVfyYzUJOjre+q7PPJZ9/FVkslQg3aAegg
         YTEFj3YcWkymWeOd7hDKqbB55nmABOI2FCSuMXi+IuHsSrz894BmCnhSabMDJ/cAv8o1
         Jl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899280; x=1783504080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRpp8Aarym9MAbA9S6grsKajHp/qT3ZkQCLbPzfeNPY=;
        b=Q7udmifvks7VNqKnS7q2NjiCv9+aCfBG6sejAZtABJp3p9iPPcq/6QdbBCU+M0HVoD
         P1NRd7z5uwUslvgRcwuBJVOyetu84lsEArfDb9h1W43Y2YpueztlbbndS6ZiW0RpG1aM
         JLrayszaw4db7eRvpKc9B3bJFG8XwpFAJ9Udnl2KL5DaY4wBZukWZeTQOz9cicWtB/31
         9DndAY/Vqz8ZN/suYXHKISIWyahWE0Jleoa/5fhErFEhujO9fpS/Es0emPZnvOQkGN5+
         9/4Jz3q3fFyG/j7dzdUBxZPhGD9NbUDJyG+BEEBXv/nR85Ar603YF/+Uy0t5XPX+kc3H
         RkAA==
X-Forwarded-Encrypted: i=1; AFNElJ+TtPp/vNEwd+cNpJwiSmYmA+D90rR6D6eT7f89qd4TcUadxXZe8HduvuiFP2Jeb2HWymNDc1o0vIo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxN3LU9b3ryJyccDZ7e15rsR6Imx5QRdj6+W3x0RLOTXeR0/ak1
	9rGH9RD4jvwBrUhK6krzQGVd/1qsYJUHz6FIiatSEJwXBKMjXObVXzOc
X-Gm-Gg: AfdE7cnlRCE2AbaJw0OU6zRuKO4vXzbwZbLGOdvzG3mlw6/y0Lnx2IwqIua5DJlpcO7
	RPqyTCTJ6DGs0+k1r3gN6+yzpst3QX2T8K1w/FzgWBz86ZMvO3BC6TKMNtAax8r1amWa8PEsXWw
	hAIOb3zOkOjyfkBdarW2hXTJ7U61+CWubMkYzQpEh05QKv7g6IQOOm18gYPHPlZEvgGX1ZSKxi9
	XWGqYfuhTHTjuX9o12F3yLiM5Md86+1XoQbU6mvzMfjzVcXJMkCQNEbpJNoCu7g6B9vY6WK54+6
	8faJsxdSoGL1ovxW36uAHwpE3HxEhcsWIfjNXt0oH/JH31umyrdiJoHtWoSF0NsJ8/spRfRKJmf
	VHZ96rtTlen6Jn1M62NWkLU/Akz6WLjDO3xTl2Oe8kbB/7uRATSrSGjrZfJ7yDCu/33j7vZ3EFq
	SLTRi/Wi3qhPU=
X-Received: by 2002:a05:6a21:7d06:b0:3bf:6c08:2b32 with SMTP id adf61e73a8af0-3bff431786dmr33434637.58.1782899280562;
        Wed, 01 Jul 2026 02:48:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbc6d9ed9sm2903779a12.7.2026.07.01.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] RISC-V: KVM: Cleanup SBI extension status when disble
Date: Wed,  1 Jul 2026 17:47:27 +0800
Message-ID: <20260701094731.1022163-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_024801_507141_CFF132DE 
X-CRM114-Status: UNSURE (   7.35  )
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

KVM SBI FWFT extension has multiple internal state can be programmed
by the userspace. However, when the FWFT feature or the FWFT extension
is disabled, the internal state will be kept as it is, which may cause
some side effect for the vCPU, cleanup these state when a SBI extension
or FWFT feature is disabled.

Inochi Amaoto (3):
  RISC-V: KVM: Add SBI extension validate callback
  RISC-V: KVM: Add SBI FWFT validation support
  RISC-V: KVM: Reset the SBI extension when disable it

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 33 +++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_fwft.c        | 25 ++++++++++++++++++++
 4 files changed, 64 insertions(+)

--
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
