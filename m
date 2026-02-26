Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624C8FD9E0A
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 19:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07GuteP77emqwjw/f7s87DVtpQo3iWXG5mT00PqqJUk=; b=tMEsojIDtk0Jnw
	2nurxKKWCS/ioNZ30L7A9uTe1GyxItPVOJvKrqJvXagZ1nFLdt7GWfoNLtXfELt56peWjP7cWGlAB
	687B42tZtTzOQgSt1XU8aYS0LV9pRJKkIwa8ZWZF7pGEnYxG9xIvk5vAOSGHP5YdKRpqfyQk4aDGH
	Wq5VLoLU5yCRfuACKeWBESX5jBqvRR1Mh4BckKt9zDKmuW/N8rDg+3u4CmePd/b3gkUDhgGZy83X4
	Q8RVilYGmuYadMu+Ne4jxpTygHDr/f/YTXc6ttuPu1QZ8RD9lLZ2lw5hhsKcgz4KB4S9RqArumDjI
	QqDjr5YwGq20LEFrbHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhRL-000000076yX-36Tl;
	Thu, 26 Feb 2026 19:54:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhRJ-000000076xk-1g5f
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 19:54:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEXxr2029560
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gkS2kEkiD1AazRxh9MEv+lrE
	cNwpZ9ngwbS4rZ3aYQY=; b=bQHQBnuY976RywjkkxRFoJe1aPFJ/Rc7+AJMIJmA
	y+xV9ItFDwrV5VVJB0WoORNHY3ApR6lEBMjFWILzqRaKb08DNmPQgvI09pZ6uSBj
	lfckXXnFndIkMCVi13Y4cS/FOC+SNPBuWAo2rpYzFC3/1TmZd9c0pLlrAIXBBAqG
	LNgSp49rX3g7BoCy0C+iLcmAK6OkH9QEtrs8O3axSSprqElupwd1tuLXwbK4p1mi
	KepYovkFCiN7wpy9Gs1QXWlb+I9U4W09ja3g6VbmI4PsB0+guOMfqWXkWtygp+wN
	GXD+RBobmG5w/pfGQD46E3ztudBgi5Kq5Touq62EVny7LA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjmp61vxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:54:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bddd304622so530852eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 26 Feb 2026 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772135662; x=1772740462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkS2kEkiD1AazRxh9MEv+lrEcNwpZ9ngwbS4rZ3aYQY=;
        b=gp+hNlXXlQ6p50KNSTXSWZesRf8pyDTs8XKuKEHJO2GXShNVXpaoyI1E6bCCmdOrw2
         B5SH5twDbWdrKyc7ssDsh5vCi2EbEC9EQ3l5CCAkU9ZKvs7pD+wQ2yOe2kXhEqeogMBA
         S1ZVlxWP7ux27ibgWXQbC8aPNwXW9034qaNiRQOJGa9zkcmQeCx/3IVN7686cUD8nky7
         C9a/GaFrN5KCn7XMo5Lm7cAXMcFtULGwyBM0Jglhk8YXypFb+Gvfsr2ToVvpyvGZD26x
         fo++Ca3DY6MgpPbz+Ix5IGoMDHZcqEnaojnc0+GcqIqfDZxSl4t0NGiR6CKAWMEmQ0ke
         Ybxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135662; x=1772740462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkS2kEkiD1AazRxh9MEv+lrEcNwpZ9ngwbS4rZ3aYQY=;
        b=LtHmAuwEdtRInKMZk3Fz+ifk/SJMxX1t2y1PQwur/6rgni75T8WJbO3qvAqFJ2YJLJ
         kaaepE+GBrCB2oZC9gEyKQreama0z3ncAfI0LhIqlTXDGb5UcRMqBYPGetQJdHCvJQFV
         A6i2GfniTfjondlYnxAreEDjRCTbJg8qEM6NrIbqAPZyPsBvyvcjfhOg+fRDby+0cBjs
         dvlEaTUj4LjCYqaiqOSNvIWEf+W1WM4/mpBjkC+n1yPLoma0823guR4GR9SHtI3EOIOm
         3vkOhw8+4FTLxMjKxKxL4tPlqU03wixJznoQYbExAgXQCWLiJgWqRMKAjNppMub+wfYI
         uYpg==
X-Forwarded-Encrypted: i=1; AJvYcCVbkoz/TjMRRsMl10vF1pcSKd2u3K7Gm4KgA8xaQxhP8vE3ofIfTsnvaJadMGUBVE806tQHrxLh+xk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvVfWgJ2RE5N7048Ztaav56zCCzM+vQA1qZgE+iryNenJXAkdv
	yUuYytTTCzwmzcNASHb/Lf6p7a98wY8WZL2D3It29alyl1k9ueEU7p9Shha1RF6FS2Ze7+g8/k9
	SC9AZz8h05WFkqkBKuYaJFbAVpCnx5L8MlJvPLb3Kti3hz35Pziry1t9RSirOXzaaCM39
X-Gm-Gg: ATEYQzzg6JRNom8lGb16H676WolXT/wOIfLzf6bimjtLPtuDdZazVRm3AxHg6sTkjN8
	qzSaLjHaKWqwEz+AaGdoFUApuhoBbecOpzKQXl9XqpWAbxnIh1phsVT3j5IndzZj5c6NTZk1gxZ
	MVMtrD7ePiyYtWFQTnXP8HEOJJ137maiK6JH0WW4g6TjheLrXld+Th8RDD442eWMSGijnu4TnQp
	bFY4R9E4FEyjHGQ07b9nBRJpUt88v6E1DV8TLmARCtmgrifPFUMQAh8kjnm1h45gBAmqR6vQab2
	rnn/PdtrZhNYWqE9P/FRJHTb/oDfW7mxMmnnJn7qkZvhOhVqWIa4MDsWCZEYpZDSl7c9lsWkDSu
	n/BTZUPqZ7wsz5Laz+r2NYDy69IHpSIs=
X-Received: by 2002:a05:7301:5795:b0:2b8:26b8:3426 with SMTP id 5a478bee46e88-2bde1bb19d9mr133472eec.13.1772135662421;
        Thu, 26 Feb 2026 11:54:22 -0800 (PST)
X-Received: by 2002:a05:7301:5795:b0:2b8:26b8:3426 with SMTP id 5a478bee46e88-2bde1bb19d9mr133461eec.13.1772135661846;
        Thu, 26 Feb 2026 11:54:21 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7ee87sm2493752eec.31.2026.02.26.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:54:21 -0800 (PST)
Date: Thu, 26 Feb 2026 13:54:19 -0600
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
Subject: Re: [PATCH v8 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <kycoxbbf7krrqaqivzin6twb4vnbl7g3xfnx2qwotwxkjklxad@37c66df75wv5>
References: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
 <20260226083234.634716-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226083234.634716-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: iJzVx2jPRmzds5nY5NVc1vqDte565C1D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4MiBTYWx0ZWRfXwUkLMA5OJNw1
 u5u6vNzXMnbEI4p8wMBmBITkSNPYmKkmWMAGM0Ivkxk2WbcyOTfqCmcR3mXU0ciBg2zq2xbXtKR
 kPUXwohUKlPZ4UWrK0cnXGiV6OstGwmyUC27s1fMFngXKN6a/cJ/hSRzc2c4/Jzu0DsPENg39kl
 iTXjcJsWhyhXWKsbu9de05yLzDPMoQtRhhEcNBpvB9GjMa8UeuyzjlYyhlgpHl6x8nLcc22XMks
 2NqtWtTLlpWKe1BPX4SlYARp+/aFPNRG9yMnL/5izewj3KHDA/hDVN/7dzTXOeI8kjdYeCR9PZA
 Psy8g7Yq8DoqU8rHI+0QE6CqbYXavB/CHrl3N63ovCkTkD7SbzYpO4/9SN6GRZqlcI6b/uYZVgU
 sOZ1KEAWY1gbqp5CVx86RI26r8eaEWU2/SG4qbancqz3pWe6m6gDzx1PwVcJ3Y8ufTFvq6BUkrQ
 op0ty5N81czmoOTHO0g==
X-Authority-Analysis: v=2.4 cv=daaNHHXe c=1 sm=1 tr=0 ts=69a0a4ef cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=a8_vTcVqeGFb8pxCYGAA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: iJzVx2jPRmzds5nY5NVc1vqDte565C1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_115425_668747_019E094D 
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

On Thu, Feb 26, 2026 at 08:32:33AM +0000, Jiakai Xu wrote:
...
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vm *vm = vcpu->vm;
> +	struct kvm_vcpu *tmp_vcpu = vm_vcpu_add(vm, NR_VCPUS, guest_code);

We probably get away with adding NR_VCPUS+1 vcpus to a vm which was
created with NR_VCPUS because we don't run it and rlimits happen to
work out, but that's pretty fragile and not a correct use of the APIs.
So, we should also create a throw-away vm,

 vm_create_with_one_vcpu()
 ...
 kvm_vm_free()


And, even if some archs don't require the temporary vm/vcpu we can use
that same pattern for all of them. So, check_steal_time_uapi() doesn't
need to take any parameters.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
