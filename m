Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405E9C79F82
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GmOsGdEqtZvM2z6q5PnFCQqSzj0jFUF2j/Qzhu87r4E=; b=Yyg7bXo/p0j+CT
	7x4tWzx6nxLNrwIfdZw7d0h3RQTbjRybx40gjqSj+SWfY+GBPDQbwlDlVIO2VoEVW6AE1fDWuH/iI
	XhMF7xwAzzDgUsz6E6cZTwFT6+mHbMisWOy3IVFcKT3y67pZaQSw2p5jh+YcWWBsXiDWE+RCVl2PZ
	bwA/kNsWBVIhCsdcoKX9V9Fa7p/6X4otEHyoMDbft3EJ4lcvgvJVhlXzPpd9d31Ek+EEiez38ntCs
	wFr7CZ3IxuQ4Axn3K5y1/jf/MPtuXfybGJgr4edlIoFCDduJqRsuysOOd/ZFq5ON5BCkx7WKAJmcg
	4yd4VX5hVXsONFYio5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sbf-00000008hWz-3esk;
	Tue, 08 Sep 2026 09:59:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sbe-00000008hVl-0Wcy;
	Tue, 08 Sep 2026 09:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KZegBIpstfYZlNnTRlUSEJcficbdVkeOBHXtxXbXEgA=; b=F0lfKe/K2Z47n2+y86vgkjMNiG
	88SRqYikOj0pS4qcIhhc33oYYTtzO1U+atHNTnOhgRA6ts3KhS/3jtpbmboeEPkYRxWGPEFEud7En
	w31VBQbGkUabpzKD8NF42wX6XHUvkWcbGivmrXg8ZLcgIOuCuroXnxeiE0hwsAgv3gNEIpbgyAMof
	Yhd85mxX/9h5fHQWQaGkfWJmNIREP/YMvT6K2zhfP/QY06+lZNCACXw8MN5ESV2MSugj3ISGKZ2+d
	6oFaEGVKYOqbSFq9xkzIjUoZXF2sHZpJ5G/FHxQdFoGNd28crOOEU5dus8ZqyQtBEZ72oH6AbV1WO
	BHRZyIsw==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sbZ-0000000HExF-3EKR;
	Tue, 08 Sep 2026 09:59:09 +0000
Received: from localhost.localdomain (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAD3YDtN3J9qi5eoBw--.22882S2;
	Tue, 08 Sep 2026 17:58:39 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [BUG] RISC-V: KVM: WARNING in mark_page_dirty_in_slot with dirty ring enabled
Date: Tue,  8 Sep 2026 17:58:13 +0800
Message-Id: <20260908095813.786-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.35.1.windows.2
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3YDtN3J9qi5eoBw--.22882S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyxZryrZF45uFWUCr1Dtrb_yoW8Jw15pF
	WrGrZxGrnrJw18tay2k3Z7Wa1FkrZ3Cay5Xw1DJrWDAr45Jr18AF9YgFWfZa15Cr1fta1I
	yFWj93W7uw15ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5Mc
	Ij6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxG
	rwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56BT7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRQECWqf0KYq3QAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_105906_297521_B4D282B2 
X-CRM114-Status: UNSURE (   9.82  )
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

Hi,

I found a crash by fuzzing KVM on RISC-V. The crash is a WARNING
in virt/kvm/kvm_main.c, mark_page_dirty_in_slot().

The kernel is built from the riscv_kvm_queue branch of the kvm-riscv
Linux tree:
  https://github.com/kvm-riscv/linux/commits/riscv_kvm_queue/
at commit:
  9167580a3495b659656c3e0f689c4b38dacb2fb5

I checked the current upstream tree and this does not appear to 
have been fixed yet.

I attempted a fix myself: the idea was to dirty pages against the
explicit faulting vCPU instead of going through the per-CPU "running
vCPU" used by mark_page_dirty_in_slot()/kvm_vcpu_mark_page_dirty().
However, I am not confident about the quality or correctness of that
patch, and the fuzzer did not produce a reproducer program, so I could
not verify whether the crash is actually fixed. For those reasons I
decided not to post it as a proper patch and instead report the bug
here.

I have uploaded the kernel configuration used for the build, the kernel 
crash log, and a patch I attempted to generate with the help of AI to 
the following gist:
https://gist.github.com/6eanut/d3e017c17f7a5a144da90a6513773b2b

If anyone is interested in investigating or fixing this bug, I would be 
happy to provide any additional information or help that may be useful.

Thanks,
Jiakai Xu


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
