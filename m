Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43774CC6B2A
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 22:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/v6fSkY+XPYqI/aP0iKgYYa1TlmzAIoOL6uGk1N12Pw=; b=xvBWHuXwmnTFBO
	ovCn6UgqaHjiXm29DFwC0RhvmJnUMk58WT/d3cvIEXxjlc5DYdJiooxiPP7A80jvkPBY235xUowur
	lGPXVl3Hz92z21MWpfkNN4eeaWdPtwTiDqKckTOqov0crGBEUDs3s53C5pPa3/sRzdvqSXVyn8DwC
	m+XEBRiFI2tqzT5+WumcE6f8Mub5TsVoc8/U7NkQ7gQw2NTh2dGR9GA6hF5w3wNbJO/6VkF3T2kpD
	i2Crwg6tyyySbrN6SLaknnYGvm6tOV4P5BZ6fI5XniNhCz3J9Woq2yFKv3L+UD0Gw2tYJ1BXBDWPF
	4GigIRLwglCNgR9T4s0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7gZ-0000000GQ2T-3H9u;
	Wed, 14 Oct 2026 22:42:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH7gW-0000000GQ0d-43ii
	for kvm-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 22:42:58 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 755E83F97F
	for <kvm-riscv@lists.infradead.org>; Wed, 14 Oct 2026 22:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017772;
	bh=WBIhOlBUrb5LSRkLKCzEi1n3OV1RnmBzhcsSOFSLY10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=QrbdOEztkpthDG5ij8p7XL/JG+2FpXXvcTH30EXToLzFo2Lj8OncB6MDEE94KM0IG
	 Rb5UxVKuo8PGpA3dFrfNTNLNZaG/UDFAS3+icQgOAN4pGw16KqJuiM2rZ4Ik0gEhfN
	 y39jaFTE6qS0pbiMYeZSwlyaOfJfdD/PA0DJRyzvvxPRmpEGhzSFEZe+LCfnAWZ6lf
	 Xm0bfPXdODUQ2f6ow3eWaW5uIwwm0HKJQ7vQcUnAuL9MYqJ3GkDMYKHk7E5QHI8cF2
	 QAN1FGU9BotGU6wv5b/wVUhEgB/FgjRjZsXulCONVV+UwaTNDEIC7s+yxnV3Fo/0ty
	 rmRWFjY8MjiD7076JWVlRb+GSUd5hLVhBhUnVYPnkugrkf5tjejsu7wGqm2sddfLgs
	 yC0QdND9YU5qY4I8UdVPwhbYLXO67Y/SbbyqDFJZHb2Ip4wWaWgTAdeyRnhNSYIddL
	 ZBQXQtqPSdZwpB4TkLt0jNQtQd0/7vSITu6two5ABIWn+XVkf8OmiXuL0l7wUg0WPL
	 MWYdOuQdBBPOySSunDLDnnb3ABZ+QnKEyVjdw6Hr7gooa+/mKqtuLQK0Yl8n41MdYH
	 ZhnkUZTfrvu30Jv7o4524iXVLHn3shYwub3Z/O0lG4aLtYc67JB3yJvK8bayKAjZzT
	 StxNgZ3J7m0EREStNjiXqw7k=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1ac6663e1so21103535e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 14 Oct 2026 15:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017772; x=1792622572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBIhOlBUrb5LSRkLKCzEi1n3OV1RnmBzhcsSOFSLY10=;
        b=1j9kHq5DOfU2M+je2PgULz5ZElYeSUkTw8e+I8Zmywx1yjdTMU94IReQU+AKJC8laz
         d3nNApKjDjRr04rhsf0PkUCUtFghqiX3qTQSe3FKFaWfmG5lgzqjnZsb/G+eaRjt+5NV
         GP/asBvphteA4WCPLkmy5HQNTANsWTcxCg3krSTldhgfUli7H3R1SH+Rbn2zQR91lJWR
         Lv+Key5/LDEWtRM4oBmOjlaRPSd1Ve3KHLutvK8BDg2kEoCyi5M/VN31fwUL2LufAI3B
         G91g7d913nRyjjAOIjtXXuKwnZYQsiobJdygI/fae2gUioLQTNJRwqqL2DG/UVw6nxLX
         SJrA==
X-Forwarded-Encrypted: i=1; AKwUvBwIzUHie0UlZexzReWNAKAjBX9ZZ/EW2zk5a5Fo0zTo/+I6nzC6++IsuyuppqPmx1poNKV3Ms8Xwic=@lists.infradead.org
X-Gm-Message-State: AFq9FYK1s54S252j80PyddQgz9FYr+D8L2vqlEe/JGFGEJ/oRNPh6V+z
	Fycj+I2o7KmyElH/bA6aVuJl96saL8PZagx73vCslQCpDShrkE3nd+gCt75S1P8noIyIgp+E8/a
	96SHJgC9Wkg4uGbS3QsuAxipznXGlL+NmlRX6h39zpavxeWD3BnmWoulQALYSzC49PUApK3TD2P
	i0pZiZ2Iw=
X-Gm-Gg: AYBFou1PMK22IYuglBrkLxvvodbTJUW7+9CeeEvoucjF6gJA9hbBip/JGm7Z8oIaee3
	e0Hs4ECxRpSPeEap4Um85TrIkFwo+9GoROmdhthOouNkMtRgT9UUEhvh8XfNssCyAMXK+s6wM60
	RLMqpd5yXMUb5rL5yO6ZZvwbyjAZUzsXi9KD16fhwov0VCxEwqlR4Ywsthu88g+pOwsHkm0cTVN
	b/jlBNWBKvYxrkvBt6cH+dfO26V0PwMeZhsMUeFv5HfY2J3gVe2ALCJvNh2JWNWLvYNPg+yOqFF
	Hb8fWLWVgH4MrmqEJWkQTivapTRf5btzYc6o3IzutB1tAlCiAHqLGyQ+D1jfJVw6pbM5eOb85dr
	EExpLFJWQs4xrOjJMXBnlKEDo2RPRrCQuRG+KmmjgQQYw0m8xW2PbRz5S
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr194079965e9.6.1792017771981;
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
X-Received: by 2002:a05:600c:e556:10b0:4a1:93fd:8f2 with SMTP id 5b1f17b1804b1-4a193fd0a16mr194079785e9.6.1792017771721;
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:51 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 0/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
Date: Thu, 15 Oct 2026 00:42:37 +0200
Message-ID: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_154257_387158_379DC527 
X-CRM114-Status: UNSURE (   7.37  )
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

Extend the KVM ISA extension array to allow KVM userspace to
detect Zicclsm, Ziccamoa, Ziccif, Za64rs.

This is just notifying of hardware provided capabilities.
No KVM specific support is needed.

Add the extensions to the get-reg-list test.

Heinrich Schuchardt (2):
  RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
  KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs

 arch/riscv/include/uapi/asm/kvm.h                |  4 ++++
 arch/riscv/kvm/isa.c                             |  8 ++++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
