Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AFA606A327
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 03:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jRGyztL2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QtxE3NnU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nU7ZDbMYgK1GUHZGGce2wx3b5kjoFHncx4RHr0AJ+lM=; b=jRGyztL2pdqGIqH9cWDthhBZZw
	pj79mWw+ugVS6RVOso41drazTGl+0U9Zs7ng9Yw/Jq/WXVgt1Fx5vcha+6Vr9WOuujuBlcvPJB7gt
	Mhcp1nX15KT4gCp3nsa5CVoa+W7DIUVK+zxvOmGcW+s+pa7UNXdxc3D/76PXF+YU3c1hWUeA0Mbrr
	bVAu0AN5HaylrQxHvV5triC1iJsVo1a72UXyNXgiJlyfhTHwnPB1CFxa/YI/3/isr5IftenPJzy9n
	AuyEq3OB3Y42GX5ZY7FOj9yNOOGJtKsmXvI0UFGcmZh/YuylmGF72+WH8t2eZSHqL9frCKEUX984w
	qGN60xMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHo-00000005RhW-4ADI;
	Tue, 24 Nov 2026 03:33:41 +0000
Received: from mail-pi2-x09.google.com ([2607:f8b0:4864:3a::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhHl-00000005RfP-29rG
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 03:33:39 +0000
Received: by mail-pi2-x09.google.com with SMTP id 41be03b00d2f7-cdd9779aac8so662243a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 19:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491217; x=1796096017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wj8SC7VUDAGsA7/l9+3e1xtsohCAj0LdZM2x+Y37EQs=;
        b=QtxE3NnU4/tmPZNRo9MUb6iQeBTfcrBfJYQbHGDQZs0h//dugzpI317j9dmRbwrR7p
         HFVAWEfHPx2jj/Gs4d8eNFq2HvpqtIdVUnWIMKNfZo3yocMM1j1HkLFe0RmGapCMD8lW
         BxV3il6+nLXPsFNtltvkbmj7QjWxDAdnR4s5APJefknM01U5bfcoYOLz9walIGI131j4
         96IVMJw+4p5W932rEgR8FdPOulfUUTfYjl31OqK3kYeWAc9mi/R+8HZDzqJB11gGB5Z8
         aXL8UzhnqPnFNjuTzGjeYtH6a2D1xPfIbQPikklDa/jKHC8VmMJMoJu8uepJuwEULu7C
         1waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491217; x=1796096017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wj8SC7VUDAGsA7/l9+3e1xtsohCAj0LdZM2x+Y37EQs=;
        b=uYK8UG0yyMCvp6mssvLGZz9yIgY8sdPe5NO5TRpkNhEFPekUXE+7lF9RbdfkzMIUJM
         jXS5x0UJiFHfh6oVaD482NduTCyTRBQdFjuZSZAly/3gnQAwZONJEEhry7U6KJHaVvyf
         WsX3mTJZ26QRaTQJVd00ZRyw4WKREj5fvFbxAn2OmmqBSI+IbeUgqmUi1zUqDahEiI4K
         bZcA1gq87TXjAzxoY2zlWEhskxhha6G4UY8/sbtVehBOY9zsS+NNYBKiOvCndC2e+UjW
         sy0CANqKrvD7VrslED+GuVV9tYeGBDDNOGBq+CMmFX09//Z5bwfa4jje/EnKPPK4ezCk
         ULRA==
X-Forwarded-Encrypted: i=1; AL+hErF2M3OULtNe9DvcyZu5MIaElIdpvpU2rzZ0+f+qAd8UmEr1/PPS5cfbbOx5NCSz0IXImWxqh99Dtww=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ykwMw8XHBXFRqw09Ij5OYWszvdJzssKOiAgDJ4PpOUbAYhxBk
	ENX2DRnwjmg7uu3KBxl4XNxXh0jnXipIipElQKJBZcIo7pg+KBASQhwe
X-Gm-Gg: AZFdTZd0cITIeB7dfkT7mWjw6fcoetoCUZvws2vjPXzyoliiI/FXmu4oOE9yv9qMXw7
	nz5ZfaaYCsQqA2fdlQOK5ep4yiszZ/HVpK3FCfaW8boK3ZvCw7CKMplYukHoFbouIWwhLQOIt+f
	4nFd/tKn6WFnsylt2PB6ATQiluiazRz45zHmYm+a72ymv+cMdeZkQ5lxAHQchck/s1F3CVTUDtX
	9aLWMn+LusFzn4b4m0DyMaS9ZcJkKi6enq83Vzhsywaple43lAA+2+t8+mYvxtHebxM+W8Tl+j1
	UTtz/wnMFkWJpqiZlAtxvwzWu5PeV18TKMY5csEZqFEjthm1pQVRH/HtMFDOveLaGAfYb+UpIgy
	aRcUbratIavHiWgca10xdBfvriV0+a/Vl4IGesGWkfT5QGRgHxTjB3MIwtX/NhYy6muRQcTRh3R
	rGosljf1OM+YS5p2WrYnF8k9uL0jMHDFtM7TmhiyILhFJfEXjx17W0+4nf7zQJMlHt+3xD+w+k5
	NC8KFNEQfPwscHyf9bfpEiQ2dhxL+AjvCvgeQ+RUsw78QQg50HdR1iAiD2AEsYLSlrue5C9DVAV
	e6lvNOkC751MI3967lB7JuLcphXaYzzCAn26NMdn7g==
X-Received: by 2002:a05:6a00:414c:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8c87c3882fcmr11093633b3a.21.1795491216650;
        Mon, 23 Nov 2026 19:33:36 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm6495773b3a.3.2026.11.23.19.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:36 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: selftests: Test steal-time dirty logging and RISC-V STA transitions
Date: Tue, 24 Nov 2026 11:33:26 +0800
Message-Id: <20261124033328.612894-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_193337_904128_1B0CF3B9 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series extends the KVM steal_time selftest to cover guest RAM
dirty-log tracking for steal-time accounting writes across architectures,
and exercises RISC-V SBI STA shared-memory state transitions.

Patch 1 fixes get_run_delay() so that missing or malformed schedstat files
fail explicitly instead of dereferencing a null stream or returning a
fabricated constant that causes polling loops to spin indefinitely.

Patch 2 enables dirty logging on the shared-area memslot in the common
per-vCPU test path, clears initialization dirty bits before checking
accounting writes, removes the v1 #ifdefs from main(), and tests three
RISC-V SBI STA transitions: disabling an active area, re-enabling the same
area (matching the SBI calls used by Linux RISC-V guest CPU hotplug
callbacks), and replacing an active registration directly with a new area
at the end of a second host page.

Changes in v2:
- Split the get_run_delay() error-handling fix into a prerequisite patch.
- Move the steal-time accounting dirty-log check into the common per-vCPU
  test path and drop the added #ifdefs from main(). (Andrew Jones)
- Separate RISC-V SBI STA disable, re-enable of the same area, and direct
  replacement of an active registration; clarify that the selftest invokes
  SBI directly rather than running Linux CPU hotplug. (Andrew Jones)
- Drop the MADV_DONTNEED check, which discarded guest page contents rather
  than modeling migration. (Andrew Jones)
- Clear initialization and transition dirty bits before each accounting
  check so registration writes cannot mask missing accounting dirty marks.
- Force bounded runnable CPU contention instead of assuming every KVM_RUN
  advances the sequence counter when run_delay is unchanged.
- Size the RISC-V two-page region using the host page size for 16K/64K
  host page compatibility, and fix Author/Signed-off-by formatting.

v1: https://lore.kernel.org/r/20261115085457.889873-1-shanbeeyoo@gmail.com/

Validation:
- RISC-V (QEMU TCG + H-ext L1 KVM): all 11 steal_time cases pass; local
  controls confirm compatibility with skipping zero-increment STA updates
  and immediate detection when the accounting dirty mark is omitted.
- Separate local 2-vCPU RISC-V Linux L2 guest run under L1 KVM confirms
  SBI STA detection and 3 CPU offline/online rounds invoking
  pv_time_cpu_down_prepare() and pv_time_cpu_online().
- x86_64 (host KVM): all 8 steal_time cases pass, plus fault-injection
  checks for missing and malformed schedstat files.

Note: AI tooling assisted with review analysis, test rework, and local
verification; all changes were reviewed and validated by the authors.

Thanks,
Bingyu

Bingyu Xian (2):
  KVM: selftests: Fail explicitly when schedstat cannot be read
  KVM: selftests: Test steal-time dirty logging and RISC-V STA
    transitions

 tools/testing/selftests/kvm/lib/test_util.c |   7 +-
 tools/testing/selftests/kvm/steal_time.c    | 233 +++++++++++++++++---
 2 files changed, 210 insertions(+), 30 deletions(-)


base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
