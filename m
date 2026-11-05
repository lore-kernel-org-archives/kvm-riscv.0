Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA6606A328
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAdv0qC0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WuMudsZ9CffSqXs3AbBadW2eK719mY55weR0U4CAKRA=; b=gAdv0qC0q52n/2xGZxbtcxgRfi
	KlClAo44HSCwKzP7IXJ/CvX3Gj++0F9uKOwZxr3NDryQE4xfjiIXYvREe56RYlyotGQSiYIH7aEdl
	NkK/wqWcGGYK7EJaH3hG/R73V4/F4rnUTlAAOyOiG93VMG2ooTw+q3Tcl7zaPTxHlU23STENosBTP
	O72JjVn16916UezDT/Q4pcy0RISXSsxjnmLeKcTAErR68Ab5vQoss8RWUGGMyghH1CFSPbiBGdlJq
	ALXXgFE/9XqmWmUz668+ZL0RIYs+lagrBG39yzkA713nIKcIWdiMVjF06oz3tIreQ+Rx7cK2QzPBX
	+jEirLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOynJ-00000009KjC-3e93;
	Thu, 05 Nov 2026 14:50:25 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOynF-00000009Kgc-37Cw;
	Thu, 05 Nov 2026 14:50:24 +0000
Received: from k3-03 (unknown [159.226.43.8])
	by APP-05 (Coremail) with SMTP id zQCowAC3T7WIl+xqYLNgAA--.7023S2;
	Thu, 05 Nov 2026 22:49:53 +0800 (CST)
From: Tan Chi <tanchi25@mails.ucas.ac.cn>
To: gong.shuai@sanechips.com.cn
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	andrew.jones@oss.qualcomm.com,
	fangyu.yu@linux.alibaba.com,
	wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn,
	gsh517025@gmail.com
Subject: Re: [RFC PATCH v2 9/9] iommu/riscv: Add riscv_iommu_attach_dev_nested
Date: Thu,  5 Nov 2026 22:49:44 +0800
Message-ID: <20261105144944.10193-1-tanchi25@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029061131.584453-10-gong.shuai@sanechips.com.cn>
References: <20261029061131.584453-10-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3T7WIl+xqYLNgAA--.7023S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar15JryfZr1DAF43WryfZwb_yoW8Gr17pr
	Z2gFWSyFn5XryF9r1kZw48GryFgF93Aa17WF15K3s2vwsxJ3srtrnxKay2va4SyrykX3W7
	Xw1q9FsrXFWUu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBGb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48J
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW5Xw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jDb1bUUUUU=
X-CM-SenderInfo: pwdquxrlsvqzpdlo2hpxfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_065022_172772_0EFEF65F 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shuai and Fei,

I noticed a potential issue with fixing the physical DC's PSCID to 0.

In QEMU, different VFIO devices can have separate stage-1 HWPTs while
sharing the same vIOMMU and stage-2 parent. This means two devices may
have different first-stage page table roots but the same host GSCID
and PSCID=0.

According to the RISC-V IOMMU specification, DC.ta.PSCID identifies
the first-stage address space when PDTV=0 and the first stage is not
Bare. Could this cause the physical IOMMU to reuse cached translations
across different stage-1 address spaces? Even broader invalidations
would not prevent such cache aliasing.

There also seems to be a related issue in patch 6.
riscv_viommu_cache_invalidate() unconditionally forces PSCV=1 and
PSCID=0. However, an IOTINVAL.VMA with PSCV=0 also invalidates global
mappings, while PSCV=1 excludes them. This appears to narrow the
guest's requested invalidation scope and could leave stale global
translations cached.

One possible approach might be to use the PSCID from the guest-provided
DC.ta when allocating the nested domain, and preserve the guest's PSCID
and PSCV settings during invalidation while substituting the host GSCID.
I'm not sure whether additional considerations are needed for PSCID
reuse or domain lifetime, though.

Thanks,
Tan Chi


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
