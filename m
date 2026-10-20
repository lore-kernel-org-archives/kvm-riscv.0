Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FA3606A31E
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 01:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aDbYzKC6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mjeZVoE+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CB0zPr+o9SjmUfBSwTxMMS1HIMA3TPmujID9hoeyqg=; b=aDbYzKC6v3lhSu
	j1HR/8rJGki8deHz+JoUhd9kEnXGmAEMjf5+jr9OVm+Hw/Kes7VAXr24ga7hHTDZG2JlV2Bj54ap5
	nK/pgASXc9HPfOaWXwoX/AKm9hTzBTWkMblPezs3xnxVxKnixYkWGD2eUnicrPKZJjDWrTlPZ7DWm
	5sNzDJMcT9oRYro/vIRjzaf6Yyg0Mqd2enqgskHi/HzWXAdSSAmFq4pxetORpvCfQz6iRbElFrUU/
	IP0CkLPLq97UwAq623yCx+RBizE+WCbuF4PmVZMFQyfZSa+fl0hFHhrdwoFgYwbsM/qtWwvLA71Ns
	it/Vf9nxmjIhlLOXudSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyaR-00000008bzh-1Y4Y;
	Tue, 20 Oct 2026 01:24:19 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyaO-00000008bzL-09fa;
	Tue, 20 Oct 2026 01:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792459448; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=q3EOLIaJ2qdXdEiMGxALnePEn7hmKAP9M8QU5KMiV3E=;
	b=mjeZVoE+15fONT/jj1qHIOZzMEkbmDKw5rJBuPWkIfzNrWYnnxpXcgSBda3g5JD+KXBfN1zJEQnKWysM06+Z57T9BF8d1oHRZOu+wT6nSFLQyHACzecFWt5fe1BkpWir18OGe5cmffoEeM4Cop6qbTLnp43Ubk6CkDxSAcWK974=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDB1Dh._1792459444;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDB1Dh._1792459444 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 09:24:06 +0800
From: fangyu.yu@linux.alibaba.com
To: tanchi25@mails.ucas.ac.cn
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v4 10/10] iommu/riscv: Add IOTINVAL.GVMA after updating DDT/PDT entries 
Date: Tue, 20 Oct 2026 09:24:03 +0800
Message-Id: <20261020012403.22247-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261019133536.1610-1-tanchi25@mails.ucas.ac.cn>
References: <20261019133536.1610-1-tanchi25@mails.ucas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_182416_716648_95941B04 
X-CRM114-Status: UNSURE (   3.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>Hi Fangyu,
>
>I wonder if riscv_iommu_iodir_set_mode() also needs a global
>IOTINVAL.GVMA now that second-stage translations are supported.
>
>It currently issues IODIR.INVAL_DDT and IOTINVAL.VMA after updating
>DDTP, but cached G-stage translations may still remain, for example
>when the IOMMU is reinitialized after a previous kernel used
>second-stage domains.
>
>Would a global IOTINVAL.GVMA (GV=0) be needed here as well?
>

Good catch.

Per the spec, adding an IOTINVAL.GVMA here is more accurate when
second-stage translation is enabled.

I'll add an IOTINVAL.GVMA in set_mode() in the next version.

Thanks,
Fangyu

>Thanks,
>Tan Chi
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
