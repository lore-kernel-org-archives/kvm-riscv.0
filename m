Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731DB606A336
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 11:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hv3rn2m1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NfrNZSom
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yuRuQdvwihvS2GXXtcqDKATAhAresYpMt+qXMBPJK0E=; b=Hv3rn2m1sENxpmAZCwwC5xvX2J
	DfJ8N3Fah35X4VAObKbzcF3GGUBwSDPB/Wh2ZRvQsws4nZZ+JI4HXiZYLE0hCENKhPGjbENUR76ib
	9UMVKnchfcURWHfCJXYqKFkx24kY5ggvRbZxjt/5sr0mGmczoGxi4pUse1NDKxTpPLqPs+iDD06Qm
	nlmAuhZX970PZOyLlP1FKINpA5kOeZDFQLfgc58tRFve4Pj3qcx6kAQsxhWdEMhXyTkiN5R6OOkJs
	3V7OuNdXAwEh4RSMxFtAuzLXOfxWEMBpG+QHf1QRhOAhSAN9FQEJ6faDBMi1ZEX6SBAJ91Zqkp+6z
	8rsC/w4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDuP-0000000GG7d-0L4V;
	Fri, 23 Oct 2026 11:58:05 +0000
Received: from out-3.mta0.migadu.com ([2001:41d0:1004:224b::3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKDuM-0000000GG6j-2Q8g
	for kvm-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 11:58:04 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZidFtH1/LnObjsGNvMsrIN8j2jFRHd//7zJzoyuXcVg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792756678; v=1; x=1793361478;
 b=NfrNZSomapIGotMnzKQ141Ht8EqMJ7W3EZbPfPMNMiYjh/9bM26MPmLPaOm8MmwQClF71wJf
 MkBDifIoWcI80GYDyDYMxQYFiEBoNboJKcJBvTeZkfeKrkkQEpIKojg1R4Z+hS9N3OdZq3VqK2k
 ITnxZTYLpTFNFUlilk3r0uhU=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8a40efd914636a4c;
	Fri, 23 Oct 2026 11:57:58 +0000
X-Mizu-Trace-ID: 8a40efd914636a4c
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on host-writable leaves
Date: Fri, 23 Oct 2026 19:57:47 +0800
Message-ID: <20261023115747.2545223-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017030927.345454-1-suunj1331@gmail.com>
References: <20261017030927.345454-1-suunj1331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_045802_758411_DDCB8B71 
X-CRM114-Status: UNSURE (   5.48  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 17, 2026 at 12:09:26PM +0900, SeungJu Cheon wrote:
> +		/* Let the slow path handle host-side write protection and CoW. */
> +		if (!(pte_val(old_pte) & KVM_GSTAGE_PTE_HOST_WRITABLE)) {
> +			ret = false;
> +			break;
> +		}

Thanks for fixing this.
Tested on QEMU 10.2.1 with a private memfd mapping and dirty logging.
A guest read followed by a write corrupts the shared backing without
this fix; and with it, CoW occurs and the backing stays unchanged.

Reviewed-by: Jinyu Tang <jinyu.tang@linux.dev>

Thanks,
Jinyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
