Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98FEEB363D
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBsQ6eaeFmjDWI4yMinhdrsO972yuBhpf3fh6d3B0t0=; b=II/pHw/A9MKA59
	uV4gUShZ+WcXyzy75ZKOZb3syqy0DgOzDlSDiwbZS740SGraTOXzeePWfSzsJF0LwopSC+rIWrMp0
	Z3a/S9XYYA5/yVJXegoHpV4Ht3jCBCe6kXxRIRPC7oBSffUVshc1iHb+qZPuRFjZvN6IkOQ5HbJPS
	+7NCs2WJSmbb5PzN0bqWKbtulEa94Yq9RkiEL7JWC/rVOxma882xzJGwBxZzxyy+gl0EBL7N8bJJr
	nl60q7GWHtIKqjiqsz4j2oCrTYUYyV2Q5FMcLT8XgxJX7iJi6mossWWKghstMw06Qz1U+IOGlejb+
	Hyw6ICGimJ/soMWt5ZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBGp-0000000E4GS-38FZ;
	Mon, 02 Mar 2026 21:57:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBGn-0000000E4FO-2bdA
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 21:57:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IVOPT3561527
	for <kvm-riscv@lists.infradead.org>; Mon, 2 Mar 2026 21:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kKGEnQyVqddtbVsVaKzEMP9/
	0r9eYevQQlpSxYQoULw=; b=QekejI2mpiNgKb1T0/vwrfrCoNAOsem1o8Sw/ucO
	FHzM/wRfm4PxxcRiftZRmvgH5WcI7YV7n9cfJOH5RtmUKFgnzgo+lE0izVwDhVgT
	QtJmS0rUZLV9vNYNyjdaZj6nhHI9+BRckTWrNWV1pWx1io7ydCOgP+IA7E3vnuMQ
	JU8PGldNHy9DY+3C1TyWRmJY+XK7YhYgcIvKBR964pyrJ9V+KTNFTmJznWZLyvGy
	mbwpAETh2U8fhYV81pQU6KIjAu98mxVBOPWvz02FgrDALKS7ZzlHBkNtND91bXAg
	8XN7sDhqjzCTy0GT1hJ0TBFV7x/V+DMlyIfvbeIl3J/l/g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bva410-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 21:57:39 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1275c2ae713so8279715c88.0
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Mar 2026 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772488659; x=1773093459; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kKGEnQyVqddtbVsVaKzEMP9/0r9eYevQQlpSxYQoULw=;
        b=e18QyIjUK1JUlprRuEJzbMAAFRZr82wNLoX6fao4OcTzdqDIhycwVrKSKD7//MbPNy
         2vFga9x39idzqmkNq8sBkGLMXUuut3YzNAzvFKQUB+HY1Xndx/Gl5lGta9BZ2j2dl/tF
         fASAgbYUTTp1211LV/Jlju0CWLeNR9dhWdg6HkEkx7vNFr+VadK+X2IgOF65LSCjQ3uA
         9CngUKaUxREX6igkdGI8BAIsu4J8ExyuZvOQ+zuuZlHC9dHGlK5PJVdNV5aocUrcCcoS
         cVZqdyndwhoqgWS1CoqwzmfF7a/5+B03YWbyZdnMvYWBkmnN8yp9W/iF3obVwn1wb1PA
         Jk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772488659; x=1773093459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKGEnQyVqddtbVsVaKzEMP9/0r9eYevQQlpSxYQoULw=;
        b=Xsal0Q7TKP6lBUPDgzntgOFLMI1VcfFQHFZCHVLv3neDRonjXEfUTp0j6z4ZV060D2
         h0w57OYLjIN/zuI0MwHm1iq74QC0O3466aci/YEuhbZv1ZMEEbi0HcfEHKYRJZQWITWc
         cKc+uU9g7uGuAb7X7FGkEpsN5Lt45xM3cJvfjWwqvFmtx2H8yySkNL/4zptvCQMmU6IA
         ITIOiRlRWReOExySPK7Mz4/an6TnHR5eaPUH5s8qHsFMnIFWJzZQpduwODyrSIhuK4/y
         93HLxprJZfvfVaYZ/gTykufDmRITsJg84rSVaFUIPKa6nzYvx83Evv42GzAi25cA+bKY
         H3xg==
X-Forwarded-Encrypted: i=1; AJvYcCWsqd04o1rlPxIAmlPEfMbj4VK0RN/T3RCAfdILr6E3Dakfs7YAcIDJc925YDtxh+OrfXCFHWSNGl4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlV/QAhMDCB52ntiCCpWimwT6os2vQUFu27d4KZ0N0R2ndYtV2
	OjXHng3GAf4sS0sbo/7PiJ0iDTtVp8TpSID0TyqgbzZarvy14CPlQlYnNc9SdN2ZxuVwZFPnzaX
	QfUFg/UbYScbQnzWFs9xdD/GOK3FYMN5vCeBHZ1ogyjJd3krATJMhz8OQx+TPdqkeNBzI
X-Gm-Gg: ATEYQzzhO3OEYAcHEEKVupGM2kZEHJEDLudzXYfXzHXn8ZdgwmfhVyi2/m0CmZpHCHM
	1v2hfSCVloIUO+oFbEYGhmIwQKamiCJAVUFPWuMgtATxT4wP2zJfFSZSgoR1f8viRdSQ45irvYu
	R4AMVQ4b6w5s2jZuIla/1Ye9NwKGkqVlBqF4AxIMzsnettQdDiGVtoZ8rckMEnSZiDKr0ShJdW2
	ft61pLnr02g9mO7mGRZyK7d28gay5nYb91UISOlxb2Vcy2WCo8NsNXtvEGB59UH+g6puI3wtL85
	gvvHYLckEGMpkzZOaYVXjYGUZtUqpAO4B2cJfC7zhnBBpMhsI0THEuyDx4gHe1ltyLbRh3ySnhT
	PUGZSquZFz2cRjYlvP0LRXJ7i6wdv4Lk=
X-Received: by 2002:a05:7022:4584:b0:119:e56b:9590 with SMTP id a92af1059eb24-1278fcf8749mr7439092c88.21.1772488658566;
        Mon, 02 Mar 2026 13:57:38 -0800 (PST)
X-Received: by 2002:a05:7022:4584:b0:119:e56b:9590 with SMTP id a92af1059eb24-1278fcf8749mr7439077c88.21.1772488658006;
        Mon, 02 Mar 2026 13:57:38 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdf662eb6dsm7208496eec.2.2026.03.02.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:57:37 -0800 (PST)
Date: Mon, 2 Mar 2026 15:57:36 -0600
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
Subject: Re: [PATCH v9 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <kxssxvwvt2dyzznftbuudkxt7gonnceou4jrjswyhkhg5vrkgh@26sivnbte6mq>
References: <20260228005355.823048-1-xujiakai2025@iscas.ac.cn>
 <20260228005355.823048-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228005355.823048-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: 5S-pkm-tc7CGjit-8Nw8TzneqhwClVOj
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a607d3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=oAJ8CtkVvmEuxm3YF40A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 5S-pkm-tc7CGjit-8Nw8TzneqhwClVOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfX02fWAaYtC1h8
 /8AMAbr5lBdXi9f2LGt6H2dVTYHI5NkNME5jV4G2ntXE5nxmrmt8kO6c/AioS4LWPCClFyFsp5E
 fzWFmYPJGrIb4VLqND82sKQpmZ0aWT4dH6CtOnnSVhXak6yLhR3rePa2oMg8rM65gkt4AuWDP5J
 6ISJzbQtS0g1YA7KlejuhkIYN/a9U8W5GF8doKkkHxxYK9/GKoJlet5EkiEnZIXr7MiR4Pcq/SN
 qnVrR9WaucTdZ5VP2NqSEPyoLjKOFCBX8r2EasVWKJ5MPOVUUcRW2qa/7ZacJBKqOSXvMhD57NZ
 45UikMvd4yXCoYubOpPwsTyEFqs71Au+wupq0IDlJuE/QPya3yTx580Alef9P61929PKPRszRFC
 ChdmLSL0Y0lXI5IsXd7euf4MCZnBDuKWaPRjkvY237lpD40gw1nXdwD9ovkt7648bNL87ZCqGyH
 pCKop9tij56SHI6TMvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_135741_768791_98CB3414 
X-CRM114-Status: GOOD (  20.00  )
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

On Sat, Feb 28, 2026 at 12:53:54AM +0000, Jiakai Xu wrote:
> Move steal time UAPI tests from steal_time_init() into a separate
> check_steal_time_uapi() function for better code organization and
> maintainability.
> 
> Previously, x86 and ARM64 architectures performed UAPI validation
> tests within steal_time_init(), mixing initialization logic with
> uapi tests.
> 
> Changes by architecture:
> x86_64:
>   - Extract MSR reserved bits test from steal_time_init()
>   - Move to check_steal_time_uapi() which tests that setting
>     MSR_KVM_STEAL_TIME with KVM_STEAL_RESERVED_MASK fails
> ARM64:
>   - Extract three UAPI tests from steal_time_init():
>      Device attribute support check
>      Misaligned IPA rejection (EINVAL)
>      Duplicate IPA setting rejection (EEXIST)
>   - Move all tests to check_steal_time_uapi()
> RISC-V:
>   - Add empty check_steal_time_uapi() stub for future use
>   - No changes to steal_time_init() (had no tests to extract)
> 
> The new check_steal_time_uapi() function:
>   - Is called once before the per-VCPU test loop
> 
> No functional change intended.
> 
> Suggested-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V8 -> V9: Created a temporary VM with one vCPU in
>            check_steal_time_uapi() instead of adding extra vCPUs to the
>            main VM.
>           Made check_steal_time_uapi() parameterless for all architectures.
> V7 -> V8: Used ST_GPA_BASE directly instead of
>            st_gva[]/sync_global_to_guest() in x86_64 and ARM64
>            check_steal_time_uapi().
>           Created a temporary vcpu in ARM64 check_steal_time_uapi() to
>            avoid EEXIST when steal_time_init() later sets IPA for vcpu[0].
>           Removed unnecessary comment in RISC-V check_steal_time_uapi().
> ---
>  tools/testing/selftests/kvm/steal_time.c | 67 ++++++++++++++++++------
>  1 file changed, 51 insertions(+), 16 deletions(-)

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
