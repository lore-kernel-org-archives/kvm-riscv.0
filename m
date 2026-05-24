Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD25FCD5BAB
	for <kvm-riscv@archiver.kernel.org>; Sun, 24 May 2026 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3C/J05POPsINgNsCSi7n6HAQHdPZG8U7jJyinDzs1vQ=; b=kql6+cuilYa8xq
	7juXvVG7f/76Mcl7SILlp05gX+hg5YuY2AxIU5qF76ebzK/b3KRqL/IJQfTwFTQo21CZQmqXZ04PM
	TnYJ5MKpWpG+lKLFg40MhxxMyfK0cH0smBzVRpsNBbeikS3co87OfU68P54hcuRfXEHJoJlUFFVNK
	Q6b0v87GWjxb0PepA0rIqV+vItEWAFw48qFkOOtKfFH2IZqAvADMYkvMquwdmtpgqC4oMqnfeecK7
	+CCfbk0/6Thd9samVW7pb1bmUxHrNCz9W1Q93yKytQTkX53nm1i7OPNE+dugBlo70D0M3KVkvk5kX
	GMhn1MnumVcZz6n3X7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREpI-0000000FX0I-1IVK;
	Sun, 24 May 2026 19:49:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wREpF-0000000FWzM-0pPP
	for kvm-riscv@lists.infradead.org;
	Sun, 24 May 2026 19:49:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OIpThl1322843
	for <kvm-riscv@lists.infradead.org>; Sun, 24 May 2026 19:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5MO/OMSAh+ISDr45BR8NwJA
	XuQI8xvKI6XO4ycoTj0=; b=N3Wz0mnpcXw5UIH0b2xrFG3DN3CKQzkY9k2DY9eM
	Qso5dHfjbzeuP7oy1uorTKXI22jUThALjtRfxAcvs4E78L8yVrSRhmjI00oepO7A
	kSq4ANK599NGcpX8yAeN+pG7408cOdP993E8LCBi8GONTLtsVb/yZ34zxuhud+Wq
	Q0iKNxI4377/ah9tNN5qK01bcgPp7GGUCuB2/uI1NHBgOIFy6w9g5WsW+WYlp6r0
	y6wVf+9iB9RYicyHIgZUP9GghqNoI9xiL304LpaJsLIyjC4fCubBmN8IoCK4D6kF
	NlBhuyZLFpZMG2FY3v9KsoVx5cKG48i71tfATu39JOfZiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asuw78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Sun, 24 May 2026 19:49:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdd327d970so5210536eec.1
        for <kvm-riscv@lists.infradead.org>; Sun, 24 May 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652167; x=1780256967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5MO/OMSAh+ISDr45BR8NwJAXuQI8xvKI6XO4ycoTj0=;
        b=G5Va/VaAKpVLu6flF96pSjCVxD39lHTZgglFOxl4tV6PYxSEON/l5m00gI3q7d8RwE
         qO5mq1MgSUI9MgcWw1N4xzCP+VFXxjNufo38tX78yp4QdTlpwvZyADrFVN9wmpJgj71H
         eEIxK8C+ajdHLGVx+eSOZNBO11lc1j477ThxzqWaj+EdtYY9U6JE6UNqUIOiC43MqlH/
         CfgU57i2/YELwhJ4ugrjz4va6fxUpOFAv/03BhC29nhH42R81PG//hvcNUdMp+Mj1ArJ
         qZU1JqWWaw2ufxXsDHQMQj44fopRp4TdjTwuIammMuP62ZpqShYXiJZPWd8/SBuiMdCD
         BKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652167; x=1780256967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5MO/OMSAh+ISDr45BR8NwJAXuQI8xvKI6XO4ycoTj0=;
        b=sO8c8K/MC60F+BR0JXeQlzgEtVeeVkBxaRUmSDMySYZacNQxNU9tNsT0otBPo8Wcj/
         LxjLpTjH4cK0MvGq7nxTM8zvQp0Lamp0hgM+AyMhVxYwDt5CK8kuO0Nk1k+EZRV/VQwY
         pW+stjYGoAvVXBpyO//GvssiuolM5KYxuqJE+WBH1uPR3+blApLe9IOov75Q3WYzV/F6
         TyyN2BQiGpmPwpQxoqaVfGMt+wJasTwLFe6qQ41MdEwU+rtBckKRfS8+eg1bF385u1Rg
         NUsHwiBBUrb2tyWZ6SzXiyHRa5sDDpPuP1S4SNOuvJKxusT/BN34lf9qY9CtKK/LxzzY
         YBbg==
X-Forwarded-Encrypted: i=1; AFNElJ++Z079GQGjjpEk2kCkrFUgNBeVHu4NSOG/3LERqUD79a6qmIAzrrxGyRWRd0Ls8xzPQ68wB6z73Ms=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwXElenhm3xjJlPWoaiFkviySRvu2dY3jWLzVDxxcS2P60PqRB
	6uiR9Xyy3wZU6lf+haX9Evx3DMIT/BbBWoGhNKHY5QT1OCk1wuBefI9vS+hMzcxy1S8SI/HoE3N
	7Czcl+zzzBtQiTgin1mBYc85MwyVEyEGQP2+VCxQ3w1WNxtY/0PO+N4TY5tUU9DLpOh3B
X-Gm-Gg: Acq92OEsW5H37EKCKks4Ti+JNGrYEBP33MQELjwt6inWfO8o5uPs/PAhHch0sKO/Fmd
	LMUhv7TDUV2accPFVPXMXNqOu57PYugCSDstymmdEvlW4B26rP1wI+W+XtsYIoj9T6JOrDqihn0
	O6OuxeAPi1J4sKvuoL6u8YPeBcTxiFzqaVZgQBDOSz4kAaZY2RM1YERRdhDrDIxA/Rt2Oq2nO9v
	x+tJy7mvSz7Mqrar5Nr40hklGBuOcD0Rsp4dhLgat22UrF/qDC3s/pexTfa1OUZGVe5SVveCThZ
	JugowrfL1dKMdRXJIvfkuz1t/jNFpvEoOBsU6GW/HOmjiab0tve8NJdVPT60ifrBTkCpyWNNzC3
	KXGqNFHtD6dmAON/SUKJ1dU/wabZU8HI=
X-Received: by 2002:a05:7300:72cd:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-3044a3f996amr5218058eec.2.1779652167010;
        Sun, 24 May 2026 12:49:27 -0700 (PDT)
X-Received: by 2002:a05:7300:72cd:b0:2e7:190:41d6 with SMTP id 5a478bee46e88-3044a3f996amr5218032eec.2.1779652166440;
        Sun, 24 May 2026 12:49:26 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef470dsm6221072eec.4.2026.05.24.12.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:26 -0700 (PDT)
Date: Sun, 24 May 2026 14:49:24 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, jiakaiPeanut@gmail.com,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend
 handler
Message-ID: <y5hmqjrtgeby3amnlfycifpfm2dc3oaj5eebgvdu3tgjjgohvx@kw3a7xpxqrbt>
References: <rqpv3mrcsxxdlaedbckb26bf5vfkj3xgd6m26me24nf4tbcqtb@jh62r2df3ur7>
 <20260523013232.2352161-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260523013232.2352161-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX7HDNKV4SWt2C
 /w5aBiScMayx9PekYY4H6f0Bs0e51nhQGI1I7b/RLJfzU91r3+bVolu1D1t29LqZ3yIPbnsahoT
 ysjQWx3MO3wjk02W5nhvOQy5pKXtGplysTW/P1R1RUn2XU0REsMbPWPo/6pMY7kyey6R40Jw6j7
 tOOyZSM6C+TMFWYS6wgQoKVDZa3obKO+hk5acXAHex1MQ6irNuhwdMrVNKOr33rqAA2zZZsvSxr
 v9PB5uE5G9W/EW20Olez18BFpsUArlgk8vbJpreSG+1yUIetWgSzZ/om5o3rcXU0qTcmknUbhlU
 y5FydsA+GlfOjdJO/aBfz959zVjz2TAXDe2x47ugaDHjE45OgUjwGf/OYxhDFUdWpMiPO5tlEwp
 yqXXYzYwi+CEjNsdAkQLNpCNZUqRY2StEare5uL24WTcAbdLo9NRdSA0CoXeoDpDYGrt7A6M40J
 Y55H1bS/c/1Rn63B9tA==
X-Proofpoint-ORIG-GUID: Pv4rPKJpV3g4Pmf1Q1FK-yk9d-7EotKJ
X-Proofpoint-GUID: Pv4rPKJpV3g4Pmf1Q1FK-yk9d-7EotKJ
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a135648 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=fKUkpt_rHN1RTTC0GtAA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_124929_350479_E26F8FF9 
X-CRM114-Status: GOOD (  20.27  )
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

On Sat, May 23, 2026 at 01:32:32AM +0000, Jiakai Xu wrote:
> > But... before we get too carried away. Unless I'm missing something, this
> > race really looks too theoretical to justify any change at all. Do you
> > have a test case in mind that could force it?
> 
> Unfortunately, I don't have a reproducer or test case that can reliably
> trigger this race. 
> 
> But as we saw earlier, this is a real bug, and we can tell that just by 
> analyzing the code.
> 
> The real environment is complex and unpredictable, and such races are 
> possible. Wouldn't it be nice if we found it and fixed it now?
>

I assume the scenario we're trying to fix is:

 HART-x                                                 HART-z
 ------                                                 ------
 SUSP()
   Check HART-y is stopped
                                                        HART_START(HART-y)
                                                        HART_STOP()
   Check HART-z is stopped
   Determine all HARTs are stopped and exit to userspace

Besides the fact that the race seems quite unlikely (only a pathological
guest would try to force it), userspace can/should still double check that
all HARTs are stopped before proceeding with its system suspend
implementation. So, since we would need to introduce a new lock to resolve
this very unlikely issue, then I'm not 100% convinced we should. I would
be more willing to fix it if I thought the host was at any risk, but I
think this is "only" a guest corruption issue. If the guest does wild
things like this during a system suspend, then it can keep all its pieces.
I would agree that we should add a comment about this choice, though.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
