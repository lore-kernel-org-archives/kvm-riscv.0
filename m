Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D71606A321
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YwPyCl5/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G0TQwbQf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y0m5fXLVjJIXeMC6ke/8kQzFQu64MQedzDmKbomR3To=; b=YwPyCl5/OtREUCI+oXm32nxNjI
	gDOowi29D6hXh9ydl4IKGIGBLeNhK2uUSHVi2GdgmniS2qNvLN15CDdjz7shKHmanI+olPMWtcm73
	sxXt6KTcA/Y+kkJW7S2m+Heaq4aNK+As0xwaHW+dEI9XZCyUinWCUS/CkXDpMrLWJU15l/1SQfvbL
	g/WgLTRcS5pKY8o9TnW4Je2NI0kRXRpFIYML33ggMTrzOZmYqwBRCw+LW6C5H4ykbFe1ekwi9yU4y
	knexFcP35XqcjBkFjoUtpbcP5yDM+WH+EakBqVVFehLF0iWhZ51QthEERfVioJUjMKCo+SeClP9sr
	GZreIW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJv-00000003Bw5-1jR5;
	Mon, 23 Nov 2026 11:34:51 +0000
Received: from out-10.mta0.migadu.com ([2001:41d0:1004:224b::a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJp-00000003Bt2-2sCM
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:34:50 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kJVYvwnmwcWNzEw2JdWH14aPDZC8p2gGMQyighOKNqY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795433683; v=1; x=1796038483;
 b=G0TQwbQf7Kj4y/R6ox6nny9M8jPCzE187Ty8ReY69/nju2wzoC+y5I9ya0vYj9QW/3FWlWyH
 G25nR7EQEz3etHUljY+sBKLfq+jmR6sCb2TE89hKrsEC2encTA8VdM4IZNCEMihAEQlDswljmJj
 inhMt+6tpk4fOfwl+SEyyLPs=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9a34595c63725e53;
	Mon, 23 Nov 2026 11:34:43 +0000
X-Mizu-Trace-ID: 9a34595c63725e53
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	kvm-riscv@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 2/3] KVM: Warn userspace against ioctls while an exit is pending
Date: Mon, 23 Nov 2026 11:34:34 +0000
Message-ID: <20261123113435.1170711-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123113435.1170711-1-fuad.tabba@linux.dev>
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033448_451520_D2A63EBD 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM_PRE_FAULT_MEMORY sets run->exit_reason to KVM_EXIT_DIRTY_RING_FULL
when it stops on a full dirty ring. If an MMIO exit is pending at that
point, the next KVM_RUN on arm64 and riscv doesn't complete it. Rather
than document that case alone, which could suggest that other ioctls
are safe, warn against invoking any ioctl other than KVM_RUN before a
pending exit is completed.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 89eb6be9bc6e3..980ef0cdc1c91 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6974,10 +6974,13 @@ to the byte array.
 
       The pending state of the operation is not preserved in state which is
       visible to userspace, thus userspace should ensure that the operation is
-      completed before performing a live migration.  Userspace can re-enter the
-      guest with an unmasked signal pending or with the immediate_exit field set
-      to complete pending operations without allowing any further instructions
-      to be executed.
+      completed before performing a live migration.  In general, userspace should
+      exercise extreme caution when invoking ioctls other than KVM_RUN prior to
+      completing the original operation.
+
+      Userspace can re-enter the guest with an unmasked signal pending or with
+      the immediate_exit field set to complete pending operations without
+      allowing any further instructions to be executed.
 
 ::
 
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
