Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E2606A31C
	for <kvm-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJkT08yA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=namei.org header.i=@namei.org header.a=rsa-sha256 header.s=2 header.b=llOAJIgb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=05UpDsFUd+tD8jVgxYZmwkUnXd8hknbpJXy0ktajFAQ=; b=HJkT08yAliXz4w1Cc1oIgxG6f0
	do2pyEVsjuouITIwklr8Y3stVKIRPRcmrNl4fbDC9ri9XPxhdHFQvBq7PQFfDEjje0FgatRaYSqmq
	q3oaUD1cgpIO4uU9yj/q6jwgL/sNYFfWLnWsxvL7koCYT/9LK44186x80PEL2N9uvDVUiTallzVzS
	2yjqIgcRH9Rg5RkR0HWlDLukTncsjZRI7kPe/i4yyasC7O5+14vXVGBlen6kdtIhpCoJUuGBZeQmF
	rBhScc9/df+3yMZkk1K61znlUHa3cESNphUOWkxNRNkxnwMOI7rUYGcJkNZOryhSj84tj63NG1tRt
	iuBxQnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQK8z-000000000Tl-2KK6;
	Mon, 09 Nov 2026 07:50:21 +0000
Received: from namei.org ([65.99.196.166] helo=mail.namei.org)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQK8x-000000000TN-0ng8;
	Mon, 09 Nov 2026 07:50:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 44C982FD;
	Mon,  9 Nov 2026 07:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.namei.org 44C982FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=namei.org; s=2;
	t=1794210616; bh=FfVfXKB4UwJOvTzIpoGIW/5MDy7wdA8hCv+2HC7E7rM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=llOAJIgbI3V5UyyycoFhCmxQwROPVnsbKhAaikUS7I/FEelUeLEtTUriwPopJdlWO
	 bxO/T9JQ8KcBuXGr9I34nfDaWkQ5DRmMpwn2Sdsgv9Rj/eL/UVmFwavcoRqf1WYtqe
	 /eyrqPFCRJD3pL1Owdm8AZ21dBX3PYMCKXjpmAjo=
Date: Sun, 8 Nov 2026 23:50:16 -0800 (PST)
From: James Morris <jmorris@namei.org>
To: Yangyu Chen <cyy@cyyself.name>
cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    stable@vger.kernel.org, Jason Montleon <jmontleo@redhat.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix G-stage page table memory leak on VM
 destroy
In-Reply-To: <tencent_C8B170AF63DC42F81A47F9EA044BB4B11C09@qq.com>
Message-ID: <81ddd9e-791-9ca-3f3-f8381c785cd@namei.org>
References: <tencent_C8B170AF63DC42F81A47F9EA044BB4B11C09@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_235019_372661_BFB03F19 
X-CRM114-Status: UNSURE (   5.50  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 31 Oct 2026, Yangyu Chen wrote:

> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Tested-by: James Morris <jmorris@namei.org>

Assisted by an LLM.

On a SpacemiT K3 CoM260 host (Sv39x4), a native port of your reproducer 
showed about 16 MiB lost per VM on Fedora's 7.3.1 kernel. With the same 
source rebuilt with this patch, each run averaged under 0.1 MiB lost per 
VM (130 measured VMs total), consistent with noise. Both figures count 
free pages held on the per-CPU lists as free.


-- 
James Morris
<jmorris@namei.org>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
