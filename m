Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C2E83F1F
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 14:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7Uf7LxUIwz6e2SB4yYs2LPmjtroNyaY0op1YTZ7Bms=; b=M9Voaaf6AOzNyj
	TpYWhmw8jS3w8KGU9OgGIqEaeL33KEznrrfbMCgwzacefWrkf2oe11BXcPxPnKxlQbQ/QBU018Bzr
	J6OsApdgVZ56TqZhDKWef8AGYkMTav9C4Y9KqPMuG+7aIticA0bsI5+pQc2f0ZgI6l4O4HyQBEZW5
	+6Nlgbblf9OLP9lZMNRESf3VckoCnpdJ/8uB74DyrqvsPGzxLl0dybpunkbNRkcv7zawrpbPnY39D
	P/3+WpBHX9ZTu77+wH+HkL7rninYnRbZdFzgBH1bzTvR3Pp8P1KKrZFwtiH8F3JfJNzV415WZg8Ko
	27SZQJma+LM6UJH1AS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0mf-0000000A3hr-2d9R;
	Thu, 05 Feb 2026 14:56:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0mb-0000000A3gQ-2yN7
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 14:56:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615AnJuL3031034
	for <kvm-riscv@lists.infradead.org>; Thu, 5 Feb 2026 14:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9g6+zH9yTy+gqiQg02/erDU6
	iT9X69ZdnysU8cGq/4k=; b=H/rALWxp2l6X54hT7X5f0Pe16GD/FTZddeL+7ndP
	GO5q0vqJu75qA6yRtJITBurImTgWxYB+/gvSu6b/9irQ8rkIsWByGEgYcvp2/wyc
	m+wuWYFG6gewptipkrCkvPZCIpWipejGYymc9JoFDaa67mKWFS7CIh1VoLGexZFM
	hDzdMogstPzZ3fUpyd9boZoux4r5NMUsgP6MIDNXDFIH8jBM5UFziM2Yc03RE8dz
	EQ/yHKTJKeNBoI8c4oDrQyUYhZbQimMZ2G/+aADOv+U7tPD57nn702DYknUI5WR+
	wAhAMTvyNdncZyusJpJJ4KX96WOTSySErcv/cY11Uvv2PA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4a7tkma8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 14:56:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a978ba9bso1632609c88.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303396; x=1770908196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9g6+zH9yTy+gqiQg02/erDU6iT9X69ZdnysU8cGq/4k=;
        b=SdYDwLoeYg79t5XUbcrYHz81lVHq8BtqhXfJFX+Pbjz1YJKYpI48tuA28eYO0WexvB
         uQP73mjQ2OC4Thporsfmf+WNOOmuQnmX5bF+9Q3nEktXYCCaRtHxP5tu8/KaZUpzvrlk
         s1w6kf2Ycyjmxdyk1dOd13QiIIEgKbjL6292XY3WLj93M+azhWGjjijLw2TzwOOetN8J
         mj1arXGcyUNKo5+SyQ4UQFkvYH8wAMpzLKRGitVCdyuIh5+fk/8KoIgn4mCL5dAWag+3
         z9VMBUOmGQPV2rsdl6FaG2ypehDX72y4dI+AK937b44jyhlzpFGWBc4ZEBNB9dNRfRoQ
         qIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303396; x=1770908196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9g6+zH9yTy+gqiQg02/erDU6iT9X69ZdnysU8cGq/4k=;
        b=tpT2A0+7oIP7HUyauv0GiXOaKp/O9vg6Qt+D5axrcLslWCkSapn1Ea40AhIzxnLe1x
         oHmg5QfrVjxrrL183Ugh30d6PJrGgEtcESpB/MVFAf8u4zOF2jAVEuDTMxMm3wF71/2a
         1kYF8OkAZYAURIUVyfTuZyOU6+dBWklGQEuwweUkj3XNk7TJQ2J/N1G7Q4YRWFXMIFYW
         l4UB9NIYUmTnTp9S3FfxXOgqymhJ1j41f1osyphoW61lxyG87VOimWzwkkNlyqfAPHt3
         kG2omz5TK16RwI7MEfm/VSjNKgd/DqLyPhzDABxalQRoceIG23FgbhgdkpFjllhp1+CX
         UC6w==
X-Forwarded-Encrypted: i=1; AJvYcCXqh7vpUrdN0mwrOGwiZJ1UNe+E0+F6RrRN0x/SuWiKVSTaKHBL/yqtq7z1kYsGbCaNR8F/yS/6gw0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiORylmG+j6rVlxizO3JnWMH1qJUOvPjLikzFfQGh4soJEHg7Q
	97s9RlECpE5HW+tD8NQpy9hX+gX8S+GRN0hw5PnW/yXyOGht2aRtURmS9v0kbuiZvvYnuZnM31g
	bp968yr7oWhtOent9DVw1Qdw94wQw3pqMpQcvpx+j8oWD1a7dluSyqmrWa/n7+CZinyqN
X-Gm-Gg: AZuq6aKIsorZgXb/8fpOMbAfzoFWeW1vgUceGkBSLCWmWrF/3/EhVMcO1O4sDrnk+Df
	C1lpNv6ZOzwoXaUZ7fA+mx23p6oIZvHCFQzo/BqN1mNsBumf/x/C9S65+04E9F8a8dLJSTZ7Onf
	sx6XjrBODimNMKcpxv1WFkImTZg755U+4U1oQlgsEEOM0HADS4QSBaSYQ8+Ll1AtnyZVhdZeM2j
	IrYXBoZR7mAmgudzFrmeMHb2V66yKs/MSkWu7MZzg8EIb0rYcPp/lY294T3ejiIvSFq1WhaJsjM
	q7SzP6Il5Y8OAupokfKYpLZlfT5U0SEEJp1dT72Bhn5ffMjYJoo9UB+6xnFRB7mGveGz/0nIFH+
	/dYs/tZZhiMp9/IiaCm4=
X-Received: by 2002:a05:7022:f90:b0:119:e56b:98a1 with SMTP id a92af1059eb24-126f4780c3bmr2575066c88.8.1770303396093;
        Thu, 05 Feb 2026 06:56:36 -0800 (PST)
X-Received: by 2002:a05:7022:f90:b0:119:e56b:98a1 with SMTP id a92af1059eb24-126f4780c3bmr2575043c88.8.1770303395516;
        Thu, 05 Feb 2026 06:56:35 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503e5aasm4543164c88.14.2026.02.05.06.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:56:35 -0800 (PST)
Date: Thu, 5 Feb 2026 08:56:33 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Support runtime configuration for per-VM's HGATP
 mode
Message-ID: <vgqqpqfqin34stqyd2gdqxiopw6vornjpmomuyctx7ngbtjj5t@ly4avedudyrx>
References: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: XGMVFCOnIq366ZbXPlJgtQ1VmrLqcmfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMyBTYWx0ZWRfX2h0PvaIdjdL9
 4h/DrKEpwWT+PlNpt7luJpCrFI7vJJXduAA52No9vKCGn6/ETZeazIhahD7cOm3OdcHvPFaVQ75
 Qcmw6Kyj9zucGM7p3ShwWQUT66JWCHh+8ynb59iPg5eQWG2LKHdlKmRX/0V2QogsN4IcnXNTd9X
 9iFs78uEHeb33xUoQRxKtQFzq4ZdFFn+MbfGtPmsCIeVM6QNFyDvDIJN90VpldJMUebhEwj9Ti6
 0bTviZ1IriPG+WlrZjYAujSr84EwQaZ6Z33mUIBnjIMYQTLGSGayhZ5z1NIXpPTvkEn7s5adbM+
 pkBKor04OLEaRLWLvYVwu/sjxs8zNpse0w+vvyphuHj2jdWG3SL4uq8ffmWsGg6sC7DPDrWbq40
 NzATs6kyDkXCE1M2Nl53YypPiiU9JW7cKSkhOjp+JQFCF9PKvOLa8zzTHz0eIXb5pfQYFW1zBmv
 4f+c/c2aiWBiiPgbbhQ==
X-Proofpoint-GUID: XGMVFCOnIq366ZbXPlJgtQ1VmrLqcmfe
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=6984afa4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8
 a=pZlcIiJjb0-w25zZ6xIA:9 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_065638_341954_0D50EA36 
X-CRM114-Status: GOOD (  13.18  )
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

On Wed, Feb 04, 2026 at 09:45:04PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Currently, RISC-V KVM hardcodes the G-stage page table format (HGATP mode)
> to the maximum mode detected at boot time (e.g., SV57x4 if supported). but
> often such a wide GPA is unnecessary, just as a host sometimes doesn't need
> sv57.
> 
> This patch introduces per-VM configurability of the G-stage mode via a new
> KVM capability: KVM_CAP_RISCV_SET_HGATP_MODE. User-space can now explicitly
> request a specific HGATP mode (SV39x4, SV48x4, SV57x4 or SV32x4) during
> VM creation.
> 

For the series,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
