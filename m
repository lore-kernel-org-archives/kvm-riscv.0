Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BD6D6AAF7
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tYJtBzjaiklgeZoR8IDUXC6ciYMb52rXuAaMehNMaQ=; b=hB7oqeHVUeu+TO
	GrDn8/tysXMhfTg1DKpapb/itU6kBCfL5mhzq5RpOt0raYeWroUCSw5VeLzZP/V6hnq39O9ArqKuj
	cfV0IExF5+GinsCWCLBalGtBbhW/dX5WR9Y6IybKj+PHe2lpNY1er8jdBn87g4gIOhjId7Ywv7r30
	/UX/HIAbYUfrhku5HrXN0Wr1uTeFdOs775YtUaSkAquxJaJTiQ5/vPJeSESXPy09uGF+8e94c7k2M
	UUYQvauaCL6SSDQYUyIMzeTRtTx5CnDM5Bno9VktvRRJ9Wp3b2fKFMLnTsoAEuK2J44TP6D6ujes/
	vochW1TCAAEShP895QIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MOE-00000000d3D-111i;
	Thu, 02 Apr 2026 18:03:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MOC-00000000d25-0znL
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 18:03:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4Y2n1562140
	for <kvm-riscv@lists.infradead.org>; Thu, 2 Apr 2026 18:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=; b=baEI5sjFaoyiOmwJ
	6mC9I/vBqJCuVOKeeG8RAV8t+T/tQcSPKl4zMsKt/k7zM4s13o8KipNtBQDhNaWY
	w1XaAgPmtXEOxXd9Wr5XDjiEZ0QtQYWmodYntrfe1tGDBe+fEB0VWaF0L/2n9ANW
	YP8q2uW/bQpa3Ximk1y2kuzn8KE3Gro4M0Px1yoTyuBHcfMEaAFFP/wpDJNqabDE
	DUeRYabbiNjQ2fP7b0He/m35pi1ZD3Bi/CfpqdoV0D9ti9ajN38NaNaz1LyGjjY8
	qnSrGDmZeJsqGJIZbtGLrnPDH5qqeGkt9JXxOL+FfK1fb3uXI69ks+tGb8W6kRCV
	QKr0xw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um70f6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 18:03:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6054bec610fso187121137.0
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775153010; x=1775757810; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=;
        b=TY6vSi/BDKEXqZYgjrR/wd94lyUS9Q0VudhqZtppJT9suk2kRdcdmwTBm2fP0EjfgL
         QnQSx8xqU5W4SMe64+DX7xLqpZnkqDofzQQ+NtmoSL5L4wWbug2qrzWLjJvw62tAcwD+
         Z1kWHAk0pdQMDx41H+4Mwohx3wP+IE+cASpnTco/CR3MEFtby6hGOcpIFx+LWfu4ykNK
         9K1IU4RpNOmvKpg6H5gILL0xd+ze2mmPzuLC3XKffLlKxL+lxIWGTqzfdTIJIZ7h34aK
         AtoW+08YQCOWMbwfRFXNZ7kKxxeVeSKM3MrZ3iWKnwq6IOytQB1v+hrvjhzGJAFu4rnc
         /cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153010; x=1775757810;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=;
        b=ig9fz6q5W10rDgOhYmlilXwQ6AFkHiNJmO68KrOMeYJObq3Kbz1lFW4Jc0vM2Z0h9x
         FTzUmWgv6uSNoDOvEofsXjj/8S6RrIa+bH5JJ7JYW8iQ0q9+NKUBC882KY5GLG+sDBLQ
         xSweBP39Tj/ghPabISLXYKZ+GUnkwpVyWN5wHAzpIQzoVkFbcILfxu1qFE1fN+rtUC7B
         Okyb07Y+YUYdShYS0j3EzchJZ/EGFzvvSweydBtibfGq1aMcttkRW5KnwwmBof2RIvrz
         qUH6JxD/xqkXPgJMNvmaF8cHlczcDLypbAQuhZWwj4hI3aQzCaONtyIk3bvWLvzbakCB
         +5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8kD85mpyigW1C+9fUmYWLe9jyMis3j2Y4QmQrUXotP1gOYbhLklH2BaMiifKKk5DizzycHSEMgk8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNDLzp0eohqxkRsH5cbnsIBVZ19MMYFN28sf4uYDQjcoJw/ZMF
	hMaKGsgJyDznuyLMti3/Of5M39JQVwQ3bXd1mMhf6ioxauFYliT+sJ/H7cOP7Hf9Kbjjj6yrhpQ
	d3W7SB+LmSy3FC3ZnnmJqnaUMBxRRO7AE8hO+qDqtSvr6EzVeReConRxP7vN6ppkwCgh1
X-Gm-Gg: ATEYQzySUnBSrrsCoFdzOH1WUklYtM2YiweGtta4N1UvxkwsiD1ckHCZDaxEqB9n8sl
	9Q4c2Cab9KQ7LaEI7qz+G/wZ2PUB2DBmPyzoizQLvY4zVuGgf/DqHgd7kPYCOdoZRbub1HpCZI3
	yfkB4IG+8flIcqszKUw4mNoDzd38RJqIhf386wIkAFffr1+9my2p/fmrj5f6ICBvUMRLGckoFX4
	4GBnE8XrGLqbmr3xmk2l8Y3pMOb5a+SDAvz0xBvgwUfaqGwDzPOIH3A1/jbUPHpWCSUnh0H+lUZ
	hdj+Fhm3e/Bdl7XruIp+NSrW/VwuZZOZiORqJV/m2FEkJLzujb4z2tWUmqqxV9B0EAogQjWhMT3
	pz2UUkIUORzmhq50RhkZpIGbq0fA/5IIHYZHifh4AWhY7348kFdqYSh0DsTde
X-Received: by 2002:a05:6102:80a3:b0:604:f029:2262 with SMTP id ada2fe7eead31-605a4fa98ecmr62666137.17.1775153010464;
        Thu, 02 Apr 2026 11:03:30 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:604:f029:2262 with SMTP id ada2fe7eead31-605a4fa98ecmr62587137.17.1775153009715;
        Thu, 02 Apr 2026 11:03:29 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm115340866b.40.2026.04.02.11.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:03:28 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 20:03:27 +0200
Message-Id: <DHIV81G43OJO.2HY4RIYFRD0RL@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-2-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69ceaf73 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8 a=VwQbUJbxAAAA:8
 a=yPi4e_CmV_5Q4fPajbcA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: rKxDZ4Ek86EBG3Hs01QlREJk-gzxBgRV
X-Proofpoint-ORIG-GUID: rKxDZ4Ek86EBG3Hs01QlREJk-gzxBgRV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2MiBTYWx0ZWRfX4MdnouBY/iLb
 zYaXZLyvFisS2FFh5/0bqUtqmgym6YjnGwLHinghjbT5wsuEOTZ/fJzYye8Lw1AE+nVP+AHxb+2
 y21EgCw2Jqxn3gKSSD6jI4xFZwGbQ28GlDzGFpHwi5h0asgucS3bdNSdti2YKwf7g196W5tmapT
 Rr0mrzTTmCv4FgfA2YtaZOIBD/Vk3KUvX24zxC2OE33DE+8MyoS5RvAfAR2rSDO09uIOzy4mlN4
 rCA5+tWSCmCR57/BNR2BaPPa7HWgmPvBklyFO3XLIOiBIHVvRUvSGjP9A3+UWs9I72GbCZ3sQrp
 pYs7cB+vI8bxPj9EalGUptzPgoHA2AtEycef3uAuERuCo7d9kztwqlv5RQKQAf2DpZWZo5KgkWq
 hEb6lqyQv+J2cMUefGGgy533sMYCBc8X5eBF6FNtu8HwzaV67Eul3ZB1jcXnFv4Z17BITHNd9Cm
 1RVwm+6JSZnTfRmIK9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_110332_285278_8FB6DF19 
X-CRM114-Status: GOOD (  12.21  )
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

2026-04-02T21:23:00+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Introduces one per-VM architecture-specific fields to support runtime
> configuration of the G-stage page table format:
>
> - kvm->arch.pgd_levels: the corresponding number of page table levels
>   for the selected mode.
>
> These fields replace the previous global variables
> kvm_riscv_gstage_mode and kvm_riscv_gstage_pgd_levels, enabling different
> virtual machines to independently select their G-stage page table format
> instead of being forced to share the maximum mode detected by the kernel
> at boot time.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -199,7 +199,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = KVM_USER_MEM_SLOTS;
>  		break;
>  	case KVM_CAP_VM_GPA_BITS:
> -		r = kvm_riscv_gstage_gpa_bits;
> +		r = kvm_riscv_gstage_gpa_bits(kvm->arch.pgd_levels);

kvm_vm_ioctl_check_extension() also gets called from with kvm == NULL
from kvm_dev_ioctl().  I think we can continue to return
...(kvm_riscv_gstage_max_pgd_levels) in that case.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
