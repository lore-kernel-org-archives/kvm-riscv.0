Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E02FD45EF
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 20:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1yRPV+3NCBShWhU2vv9e16FxoUzTu24GRQnI7b+diw=; b=aa73Jxgf40b1pi
	zBYMDiL8AJvaX0SkH039Hf+IhzqpmJSuMSGctg+4+rJtl/D/qARzhFUqf2PJY6ZMse4WFcWqybbv5
	KuawBDF1g+p8WCuMmAYFXJ0iLcJ+/C1FSUrPM5WWZD/sfYlrRb2TkFIwH1fgwPvjb6H/+w2/Z+p3T
	BGJWiGgwPZUNAroXPOGwdWBAEZdIrg9fKuWBCz78YGF3ojhHiq5hRvijLlKty8ykdA/VNMgxDP6d6
	cxJi+6qp5QZXMJXBR0ofM0mRK9Vro9XM8VvIK0Wtkkym7u2NlKzG9GCJPw4hQ9/ILwkSLOyHKnW9U
	S+FqumJzhA6kZKeVJkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLQw-00000004r6L-03ct;
	Wed, 25 Feb 2026 20:24:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLQu-00000004r5H-095T
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 20:24:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PJRmrH789069
	for <kvm-riscv@lists.infradead.org>; Wed, 25 Feb 2026 20:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ViM3bl/bhSwh8kkJsBsCCLgQ
	HaybEDvS+RnPqWJYUig=; b=jycbxzVZxCPwB0Wm6fMD8BMxRMoCpxf3Fa8xUSwq
	Q/95DIUkpR4zp/21/Ao3lTEm637b1sn0VzRZJw7y6LbIkT0dfNSfW3lJJpHBAP7z
	MCL62hcovmylKC+yQJDBno3fX6oWA/cQyHnPG0J6Gprsil0O129pEzLqR9L6HBzw
	RVKvX0ilA6zzRaW/dRvf31rNNG9tklNZ9ZPJtPgqJovWO1/5r2j8hfCuos8NL19N
	hafj1hTUe5tvD8vdBYdkdEE47QdkjP2NhOBoB70NxTFJaFXZCB+iyyrqX3llIUEK
	PlcMkgVwzsfeZXgb0uipGLq8xQkFB7nZ2vgmOTQ/MhQgXQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9hq53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Wed, 25 Feb 2026 20:24:30 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12721cd1a2aso1411003c88.1
        for <kvm-riscv@lists.infradead.org>; Wed, 25 Feb 2026 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772051070; x=1772655870; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ViM3bl/bhSwh8kkJsBsCCLgQHaybEDvS+RnPqWJYUig=;
        b=HlMQX4lbXaT+Q0GAdJdTTwpdDyNYvIxeg/BiBYvi1GHdnF+5zvYRWjbBritfOfZ0Jy
         HeJgdojkOpNTrgdEhpjrN3OyiKmHX9F6mz7sdbw68ydo+1GLpdmaB1IMopa594IakYHV
         05qcADryeoqxKbu6qlKE2U5kU9Hu6rNCwOF1SZEslT8MSHubMsazisb5rYkxglkFtz/7
         n++f3RJ5r3/hzAPQpgO3sT80h3p/LqGUE39pyKt7bxe+aBxN+NcAbX60VWmCzpYFCM/0
         6FT69Rwma4bXUv163DD++aWk7pNs0FCnumCcHt/z7Ku4tvk+DFGRkATV0pzzvf/mlHMP
         FKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772051070; x=1772655870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViM3bl/bhSwh8kkJsBsCCLgQHaybEDvS+RnPqWJYUig=;
        b=tfJ+3mzPrr+4+XGcwvPRuLaYEtBcQV4Rkk9m5dsAkICnmJwQY3BOPlYpvTIPLF2q8Q
         9L7Yn4Nouqcaf2OaQbTPVsAsax7o1DhHfaxXSk5ItbeDA3obgklWaHjjefKy2gRpfCFe
         aSFahCPGU9CvWjTOEwBY5xBAQ0iOQsS4aQ1YaE+4TqKNif+FTlk/K6NES1NSz+zCnHzf
         4O08i+3JBmmUvYOIHqo7wTKaRSOFLq20ErEmol55FFXNkm17/K/ONBhwB+qxnLn8DkCe
         cQeKaee8IbHRGXAXX+e8WePzwFvLZeiVTpEhXPLUDYJYMDjs2aOLuQSRV+qG0dAvJpum
         24CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKYzOqxm7YjMRO6vXPZcWz9S3LIZDATYVq8D9TXg2z5y+WOMrxla9+7sLF0cP2erl83kWY7jQgqzk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv+7hyEFPOE/UOLx137gSCasxyRe5JH+lidl2CdgJQ1YyRMVfA
	PruD5MiUtdKUi4RAl1CZZgv6l5R9lc4TwmPzjBogjURkv5g9+VIQ4fnIE/sutkLHAY4bAVMi6EN
	CDyKLEjaOY0n74P0UPEgshoC4RQVahy3IunVWJIR7w42lt7R+xboCLPfRuYEJ0UYYUk2u
X-Gm-Gg: ATEYQzyc6oIMzm1qUalerp1hhVOTUwx8wJGbunoupT5+MpFLIkjt+dgheHY21uJdk8V
	vTCePit+oyk6YUZ0CDERD+kfwiciI6JGedjUT8VEiqTP2RGurCEjkcj/t1NTFpP7xVY6LBT4aCJ
	v6m145WwF50iSYuIdXTVpALSIFWq00DUeMulndNHcSpo2ouCdeOA/Dc/kemn4VucZukKTjX3F7g
	3UiVc6LtSBUuZAVZ5qi9LJOysV73ZoZ+aZyXZb4bSygrrTpiZcuIZzam1t4QWPltgU4PbJLOC0R
	w5sHWcjIGHLLSnRgcQJ4Cgc7RK3zyRZfghX5+sWM/nqLbNRLwc9/6w0/EFUudbTAPwo8q39LiWQ
	XZke/lIWkHlJnX/HpQ9EKVI+F16bpAVZ/
X-Received: by 2002:a05:7022:1602:b0:11b:a3a7:65cd with SMTP id a92af1059eb24-1276acbc703mr7227445c88.12.1772051069882;
        Wed, 25 Feb 2026 12:24:29 -0800 (PST)
X-Received: by 2002:a05:7022:1602:b0:11b:a3a7:65cd with SMTP id a92af1059eb24-1276acbc703mr7227424c88.12.1772051069326;
        Wed, 25 Feb 2026 12:24:29 -0800 (PST)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2ea06sm17068982c88.7.2026.02.25.12.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:24:28 -0800 (PST)
Date: Wed, 25 Feb 2026 14:24:26 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Conor Dooley <conor.dooley@microchip.com>,
        Yong-Xuan Wang <yongxuan.wang@sifive.com>,
        Nutty Liu <nutty.liu@hotmail.com>, Paul Walmsley <pjw@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
Message-ID: <srfopv36p4yeaok6qhew4md6uzo7mq4u75fr2wvxtjyk45lqvj@vuqap6n2szdo>
References: <20260225031402.841618-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225031402.841618-1-tjytimi@163.com>
X-Proofpoint-ORIG-GUID: xBKeLf0V4eyPDvdCrIiDb82rEfVQtnTP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE5NSBTYWx0ZWRfX/xEqKfGBSi5Z
 BkjlJAdiI8Le1+7aIBffBOH9cKygnuqNo/h4NoqelIihp3p7QIk7ouXVQMQxDtcqTdu1xymTUDw
 un/99oUmlqJClisXVN3ZJRXqHfZxclaWRbqiRKUmpcsJPja8lXCpYs+ZxWQWsPIxmYgrw4dKkgC
 5wNbwrI1RsQrz+mCnogohJwXqW0RcdmvaChnouI3bQ/dtIBwFUgofBQV9UlttlDKiS+zCWXDvja
 TxfFlxm76Sg/gFFq65XffEFQyHtug02Y3Dtygl8bfTzfd10hySKS4R1nqx+5H1Yn2rN+LlmZfFW
 zWqubwBX8kuP70YCcFAWKkhheZW+MBgt/NMWBj+gWUIUuo1A6/Uwk2vKUrAca7D8sDNyOAXXbEu
 3CnZm44NkSniPZpN7Y7SOcOAlh7R/9Swb6EFd0KaAgpgGcIodhLMmVXH/yCCIBlxdmUWdSlGZLG
 cxgqmjrbBkhu5xsPkjA==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699f5a7e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=OC80/TC5XWgnnCQ5Z9xtWg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=xdnJNkqn3fnCMyRjZDMA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: xBKeLf0V4eyPDvdCrIiDb82rEfVQtnTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_122432_197523_D728F427 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, Feb 25, 2026 at 11:14:02AM +0800, Jinyu Tang wrote:
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
>  
> +	/*
> +	 * If VCPU is being reloaded on the same physical CPU and no
> +	 * other KVM VCPU has run on this CPU since it was last put,
> +	 * we can skip the expensive CSR and HGATP writes.
> +	 *
> +	 * Note: If a new CSR is added to this fast-path skip block,
> +	 * make sure that 'csr_dirty' is set to true in any
> +	 * ioctl (e.g., KVM_SET_ONE_REG) that modifies it.
> +	 */
> +	if (vcpu == __this_cpu_read(kvm_former_vcpu) &&
> +	    vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)

The most expensive check condition, __this_cpu_read(), should come last
in order to short-circuit it when either of the cheap checks fail.

> +		goto csr_restore_done;
> +
> +	vcpu->arch.csr_dirty = false;
>  	if (kvm_riscv_nacl_sync_csr_available()) {
>  		nsh = nacl_shmem();
>  		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
> @@ -624,6 +642,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	kvm_riscv_mmu_update_hgatp(vcpu);
>  
> +csr_restore_done:
>  	kvm_riscv_vcpu_timer_restore(vcpu);
>  
>  	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
> @@ -645,6 +664,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  	void *nsh;
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  
> +	__this_cpu_write(kvm_former_vcpu, vcpu);

This write can be skipped by the fast path since kvm_former_vcpu is
already set to vcpu.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
