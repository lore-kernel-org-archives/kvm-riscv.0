Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071E4606A31B
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JTczvItg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VvhpJQQ7XsjwVH5KYdnVmk13BbtM8uRIhoU+Oq1VNFk=; b=JTczvItgf4rLas2ysmnlqSONyM
	f1BR5ajIW6tCSWVOy5LsTk7J4JqigrtNmbnzNeX5aSHKedc+GD80RXqcb8XHfddVK4EHdvPpmzLiT
	nS6N8j3ZdBlT5f8WCw6K47h/rwgn7UXnxFC0swDHsqR/uRw20lvBRKjbU3tlC7tbAcu6Xl8hjG0v6
	iBQaY2evCo0gGkiBiU5GCpGbVUpvKEZD+hVIrYAWRZ/kRdbW2S/UgMIBDo3hM1aMbbgcW6AkPpVQ0
	FLI/jsAsJ8NwBEsnUBSCI6Ro+u2wyBJ9FOh9/xPObg8uF5nh4TDs8ERfUB8kOaI6ceLh76mOC0wIK
	Ihu+riqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUl6-00000004R6y-1Frk;
	Wed, 04 Nov 2026 06:46:08 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUl3-00000004R6H-1PeK;
	Wed, 04 Nov 2026 06:46:06 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jKGDJ0s8Cz8Xrrf;
	Wed, 04 Nov 2026 14:45:52 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl2.zte.com.cn with SMTP id 6A46jiZE066518;
	Wed, 4 Nov 2026 14:45:44 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Wed, 4 Nov 2026 14:45:46 +0800
X-Zmail-TransId: 3e816aead493029-bd580
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: fangyu.yu@linux.alibaba.com
Cc: ajones@ventanamicro.com, alex@ghiti.fr, andrew.jones@linux.dev,
        anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
        baolu.lu@linux.intel.com, gong.shuai@sanechips.com.cn,
        guoren@kernel.org, iommu@lists.linux.dev, jgg@nvidia.com, jgg@ziepe.ca,
        joerg.roedel@amd.com, joro@8bytes.org, jroedel@suse.de,
        kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
        skhawaja@google.com, tanchi25@mails.ucas.ac.cn, tjeznach@rivosinc.com,
        tomasz.jeznach@linux.dev, vasant.hegde@amd.com, will@kernel.org,
        zong.li@sifive.com
Subject: Re: [PATCH v7 06/10] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Wed,  4 Nov 2026 14:45:40 +0800
Message-ID: <20261104064540.115560-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103120236.53474-7-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-7-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6A46jiZE066518
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 04 Nov 2026 14:45:52 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEAD4A0.000/4jKGDJ0s8Cz8Xrrf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_224605_543481_41EFDAEC 
X-CRM114-Status: UNSURE (   9.73  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fangyu,

> From: Tomasz Jeznach <tjeznach@rivosinc.com>
> 
> Enable KVM/VFIO support on RISC-V architecture.
> 
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  arch/riscv/kvm/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index f7e4d0f9b156..13552cfc2cd3 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -28,8 +28,10 @@ config KVM
>  	select KVM_GENERIC_HARDWARE_ENABLING
>  	select KVM_GENERIC_PRE_FAULT_MEMORY
>  	select VIRT_XFER_TO_GUEST_WORK
> +	select KVM_VFIO
>  	select SCHED_INFO
>  	select GUEST_PERF_EVENTS if PERF_EVENTS
> +	select SRCU

This option is now meaningless, please remove it.
See:
https://lore.kernel.org/linux-riscv/20230105003813.1770367-5-paulmck@kernel.org/

Thanks,
Shuai

>  	help
>  	  Support hosting virtualized guest machines.
>  
> -- 
> 2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
