Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A95EB363D
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCiz+52cWXZOnxTEJg8ByEKY/syIkDzuhiW6fNudOxw=; b=hytIohLtYvM4bd
	XsvhRb7Hg1ny2L4CXMuLILveDn1B4/3jE9OHc2NGBXgdESxeS7cIZSn4Mmmhif9pEL9iudqq+dOJ1
	D3y9I21GGDnrKbwFRY2kZPBR71NJuqsMixVpCE/Gqwz8dJGoL9UWo+wnmzkN+j30DXqnf/ACtf5S0
	g6XJ9S8vk0ezL70cJC5Ub685a+HYt1QSrD3R3FcA9CJ8U9ZtMri4I06xHVTo/JFszj/nrP02PbFMo
	rLSeEwiQDzwajq6nLAQskJ6Gcn6kN3suay3+w1gC4vCPu5fvCdV+rOdGEed9yAnkJ2tISWfOWlVcY
	CLW2aB9zP/KL4OJkFy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBR9-0000000E5MH-1gHt;
	Mon, 02 Mar 2026 22:08:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBR7-0000000E5LI-00FM
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 22:08:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IuoSm1187020
	for <kvm-riscv@lists.infradead.org>; Mon, 2 Mar 2026 22:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aFlTulkTiHRUNVyM0yuMIYm1
	zlj17kVnR05A3j3KKwk=; b=oD3V9X0GhEe5gFKThb2dbOb327G4eOVgVqX3P1wp
	dp/UZ86q8QykjGUFi6SsqRNxEb69gly/McwN7KNqkIBQBfxOqaBRAHCPChCxr8Wy
	HRrDp5APKjbi7PaJSkvCLgngOHHIdeGqPL/VBbSKoj8wEbn32+oAb22fGki2N9tE
	uckjZffASObUusEP+/pmBeHrC5mI21QPgWFLQ8EgF/IeIFacMIMCQ3G1dNHZMylT
	+22//KWD9fsMUpdOEP4RnqSzNjQjGeX8xse2Fe5dh4acv4rrWyYWG9DlE6KxOM0w
	jnXsQ/EJDFCQmuCDa59W4RFtrevm2tnR0JcjTrpUfCD6Dw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cng96gj55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 22:08:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12721cd1a2aso57457971c88.1
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772489299; x=1773094099; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFlTulkTiHRUNVyM0yuMIYm1zlj17kVnR05A3j3KKwk=;
        b=IyIGbLJKGQcR8fHwnAWiwgHqAH7RAeg3ovQhNML3RI+TxcuEbmuy2IhDLIM7qWV6+q
         J1Z6EQ/3k+aJnNcF3SOlVwR8rYvEqjGll/GzxHv0CnM+U42P/8Cq24uWyCEZvB7fT99P
         CQlS8Lbn12jduIuDCCazgMYYUjzEB0F1j04EEtXx8xRNX8HZoKkodPrL1HLLTTMPShG4
         8A8Uv0Z2Tk9Nsgv+n7t2T+0gp8g/RBSGaj+aoTl1p8M92hERWe9QhpdwZF0EWqIPDRk3
         6CN7zlp6xLACBeIdMPs/lu1F6tFUQg9XNWujIrJsI2Oo+5BZvREFrcMHQtYNckbbWNdS
         gY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772489299; x=1773094099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFlTulkTiHRUNVyM0yuMIYm1zlj17kVnR05A3j3KKwk=;
        b=jmzzTyGgdofNEhp4B064jK3TDNzAton0yty+yqhVb+y/HxytpZD4Fi3UIREO5JYpaw
         gv4iCFPQShcliwfAK4oBOxa+o/NBN5mdDY8G4pISREoz5U8Q6bsJqSVef6P0Z0ARfCfq
         /g8hztwN12rypqO8ZuWJtJKHo23ZSihotZXvCWqhXLXsAIY2DmpAYlrHn8Zh58tKJ8Lf
         SNvS/pPmujQ+f+TAoOn4lvcN2HWW80MrFLbJTwUH83DD/KkoBT82mZHbmwletlk8Qdic
         OE7JeemzuMgzCWqBJ1MxSCQTbdATWDSlG8DD1ORESvqwiQoBT/IWEBW+QFf+/GY28Q30
         ky4A==
X-Forwarded-Encrypted: i=1; AJvYcCXUO6jBUi2pWQEdczQngbhawV09oRHuRol2hQDXgFs/uWPgmPQPKgxRMS/wuPfQPqh98SVo8K9fkzI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwT81T7f1MIUL7P3owT5Wi2ok4mOaewgrFY+tIis7k7whfu4daq
	Oq/N3TLSHF7s+ETL2svtojXN995YiXa22xvDn2QWjBBS9XiVvfAcFkpPcHGDi7AAeoeM3K6A3tR
	om51ICXIgRIXFDd99ca+aZ+9ThUsk6uW5yUCAIJ+WWWbPAZoVwMovGoi/wmQf46NsbGa5
X-Gm-Gg: ATEYQzw2HxQnFETiU9Gzgbx1+++0XBrC0Aa6ojLy8tKnR8hL4CMLCKOGKqmZyHHMQgD
	uCf2cn5oNQIaCa67ggr5TJYh5iWNMxG40fS3K089Y9WDXiJTSxYFR2gi1e2rCqGw7zOk1jAvCId
	Cpndn8KeQABYU4fWL8C2ETl/g+vqYjNdzjBMay2Q6cLjFAyH1ZViEvb1P/Wihq8L6Rka7HODp+9
	ot6GlgHA4ujt2sxYA/pUERKnFK6wNrMUXvbMTap6nwNrOQmukwOOYmgnOsGixfabm5lCZnuUqF8
	kB2wJRxBanBUS+NMX7+c74gVVErTy64bhAVWa0H+gFCWy2V0vTmfnq3eWsD+iWZBD05ueSRZyy3
	bEq7x0ySHx87iJOhYJubvISLK0GLEk4w=
X-Received: by 2002:a05:7022:128f:b0:123:3461:99be with SMTP id a92af1059eb24-1278fcdfe04mr7472438c88.21.1772489298690;
        Mon, 02 Mar 2026 14:08:18 -0800 (PST)
X-Received: by 2002:a05:7022:128f:b0:123:3461:99be with SMTP id a92af1059eb24-1278fcdfe04mr7472413c88.21.1772489298167;
        Mon, 02 Mar 2026 14:08:18 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm18367820c88.6.2026.03.02.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 14:08:17 -0800 (PST)
Date: Mon, 2 Mar 2026 16:08:16 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Albert Ou <aou@eecs.berkeley.edu>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v9 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <xhcbisolsce6mbaoovxpzbsyqfdtptnny44uqbfcbte5udtg2g@wqgprootl7yt>
References: <20260228005355.823048-1-xujiakai2025@iscas.ac.cn>
 <20260228005355.823048-4-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228005355.823048-4-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=Co6ys34D c=1 sm=1 tr=0 ts=69a60a53 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9KHX6hOa5LuH6kksGFwA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: rUN23nYjRBnm_x3QWi40LPmDlspvbw5P
X-Proofpoint-ORIG-GUID: rUN23nYjRBnm_x3QWi40LPmDlspvbw5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfXw8CWE4WKMZD1
 buYgTv+flXtnFNPyHYRvEsOc7zAhFF/DeF+6isXjSroXG3KQXnTp0lCi5Dwf6uDGPBunaHz6c4i
 CmR/+2cL+x0llSgGMgZq9IBtfuw6OkwEZrVhOdrr8aa0MindgBxe7fKviuJoGRH9mp5LWXt4QE6
 nZuicE7YkXTFamN2Gi0AJazV0b5K+Lyg5kfCuBY0LiEaVtmGlooGadWPqT8PQ1vAnWASTe4Vu2B
 9N0tX4mpKFkzMVhNUbUxpKuNC6UEn2WXq8Xtqc+0vkMnq1/96jTeCk6rFldDAbBmWyPPZCy2DvH
 oPtYjaThqXO0ojEk++Ce2nw3wN+nYD83EK3S/8HO4Kb241WcSy1ABvKOkmPSR+z+XcRCCGo7R5h
 buzHjXdyYEIilW9rZ+ooCTK7yqRSTJPin7RaBsKnwhFE7yJwP36GTnk1r0I7PdDvG2jOL7mtDNz
 eJCfrc+OiEYEUQLpT1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_140821_186234_8327F3D3 
X-CRM114-Status: GOOD (  18.79  )
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

On Sat, Feb 28, 2026 at 12:53:55AM +0000, Jiakai Xu wrote:
> Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> shared memory alignment requirements.
> 
> The SBI specification requires the STA shared memory GPA to be 64-byte
> aligned, or set to all-ones to explicitly disable steal-time accounting.
> This test verifies that KVM enforces the expected behavior when
> configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> 
> Specifically, the test checks that:
> - misaligned GPAs are rejected with -EINVAL
> - 64-byte aligned GPAs are accepted
> - all-ones GPA is accepted
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V8 -> V9: Dropped __riscv guard around INVALID_GPA, which is common to
>            all architectures.
> V7 -> V8: Moved INVALID_GPA definition to kvm_util_types.h.
>           Removed comments in RISC-V check_steal_time_uapi().
>           Corrected reg.id assignment for SBI STA.
> V6 -> V7: Removed RISCV_SBI_STA_REG() macro addition and used existing
>            KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
>           Refined assertion messages per review feedback.
>           Split into two patches per Andrew Jones' suggestion:
>            Refactored UAPI tests from steal_time_init() into dedicated
>             check_steal_time_uapi() function and added empty stub for
>             RISC-V.
>            Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  .../selftests/kvm/include/kvm_util_types.h    |  2 ++
>  tools/testing/selftests/kvm/steal_time.c      | 31 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
