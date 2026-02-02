Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFEBE7DEFE
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BLoIUYN6ZYobO1+xwpcnOQ0z/ecRZDqVp5xyLEtooQ=; b=q1vVQJv31Zfgxk
	8XmFltB6WEATTW0EGS6IqxQZ4a3Bs4gP2+IxjBC7kh9RSTX57Gt4Red7/llMnCclceFmZnSxArqHD
	XWabQOsqpdw3sppCut2XEOzPjqtgW1IUTLaG65++v1FRY5wu3TEe19aWz/njsRuoRak/wPoGTyyhO
	L39PTauRvE7ZhCP+rIQHhaYVZRVZ4bSPTeEyyrYeM2Sj/CIWdDh5/LKznKgaMhyUYqhFehOOZDBV2
	xAxI6cpBHWNsZaKLrWZ+AVaUmkiwhGiyRbQ7F937qb6CpnNVebkI+W4CvA9YcU944tAdRKgqS1g+f
	9W+O52w9Xv3k07kUSKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwpx-00000005IXV-0rn8;
	Mon, 02 Feb 2026 16:31:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwpu-00000005IWv-3y2W
	for kvm-riscv@bombadil.infradead.org;
	Mon, 02 Feb 2026 16:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eTpxpJLfJ8cj2Yer+m230biy2Ugzgu3eLhQ6MAn7/Yg=; b=HRWQp+qIJaHyYXlQoBi9neeQL8
	WUISFg78rnRpo2HVSIycPA0lkCyO78Qur8dsukPXm781RA/oKpIl5hXXK9NNrJcuePzDmq8a4ZCkD
	w5ka8caCgXI9ZcqqM+WEUs5tmuTEXwxDBky0AS4GyTz2iXHPcqwxSss4fevGUiB1aqN9dGshUehP0
	tuFNpxunT6DiJNyi9laCmR19xqqIJ2VGppRYkCB2t8/Fny9fTV81cl+YrGmv2FrJvoty3UGq9q7Fl
	BuAtwaL0tQDBRV4qfjC7kIyJ9Hq4Qwtn9EJbO3VpbtuXmsl0WPHxOYrXNPEDg2s2sZ/ZvFiBv3wS6
	9NDmd5Ew==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwpr-0000000EqYm-38Oh
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 16:31:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AP67n2106161
	for <kvm-riscv@lists.infradead.org>; Mon, 2 Feb 2026 16:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eTpxpJLfJ8cj2Yer+m230biy
	2Ugzgu3eLhQ6MAn7/Yg=; b=H0aD1TdxU3ROBS+Dk3n49fvNaVNdzl1HXpx32sgB
	17Iu02FVFeS4Y2dAWxrBxUAHl+txY6kJBe5J34T6Nv9MDG1vQgq81sN+VfbtK7Xl
	1LMhRrniXNA1FLoK4apBSVgk6vI8t6q2pnMpXKInbjnnFgDx/l1ycEXVUkGWosYc
	S/8IKdhJpeCPe/ih3kVoCdpXYh6vrk3rKCCmURY+o6hDqaQoVVGmT7zcXV++yxSt
	eg/L6K+tzkdaeZljm0t/R/3MGIT8jiA2dCAJayuorPkWzuCEAKr34CcwFqm1/QCL
	WIaEpwtnQNgMulownNMgayZCMl6dKUsoBYkz8GCDNgAwIw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2t5e92jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 16:31:33 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124627fc58dso7401870c88.1
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 08:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770049892; x=1770654692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTpxpJLfJ8cj2Yer+m230biy2Ugzgu3eLhQ6MAn7/Yg=;
        b=fQTmBP0B6pPsq+AdHP9n8RsnKeUXrXQ+hFAmvQmpepKWcfZQSbYyJN0ek9q0cDb9el
         L5wdVMdaKN9EPnL+Shyw5gdteUuCf612M2iC86vvWlB7Q26jH4fBlZoy9NkJvz6nGrZ4
         kzurDYzeyCUAGgzatxDApInQmhldiOydFJ6UyVGn8juQGKBjIIcBp036TWHXja2rHyrk
         XNN2kDiQzRB27hZEZoFwH5S8+89AWWSecLeofhQqyVtic6L5/SASn4S0R14M8zh7iYDr
         ggVJjp57IfNFiSQQSJEaBCScEwF43ThQyDezEf5VDdbxA3QR1B2R9IvXG45JBn64rNbU
         JA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049892; x=1770654692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTpxpJLfJ8cj2Yer+m230biy2Ugzgu3eLhQ6MAn7/Yg=;
        b=O3VmyCO4oLBehR48fEo3GNGJwUpnt7GK2eyucFktqN85CfaLqhYpsF8SNCuScs9+AZ
         FCyrhZFfp1WpeCaOgHsQhTnXb97YE/ULhHpwowadzden+8Rc1F+AAp33juCi3yEYpDaL
         1f7WzOjxzdKIhentOd+YuSZLefCmgR1fU/kafKPVNs1+TvHyNT9UK+RFcXxHckgL8o7/
         4cETOSCr/+x+bdXhTn12pX4E1OD3Tq3qv8bURQAEOkTspq7XMrhP1fw2FsyhwuqTdKIF
         op6w+HocQVwFNjoNczLLXaUv/ZuIVdBFY0BumtTcxA9lKFaV3W72q6v2y/yf786cKnFO
         XxDA==
X-Forwarded-Encrypted: i=1; AJvYcCWOv3u8OEOqslkbiUbxr3nHaIrQf3JbET9zmg9NderaI9BskS+NmRjSWAa0UAPAQIt6unod6ihDntY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUQj7ajOjdjr1tD578B5jIKpqVNZmIZPpNPDrdxnE1/PTQVaJM
	Fa+gcDTyC2qe/JGoqqQWh7jtxEmoK8VwL+xt+XHem8BfkoFdu8u4uUl8DJr8bI7n2n7c1hMmMj5
	7na1M9rb5wNLyo6C8h/j12qBtUlARwbuPqdSySPMbgimMqPA+WYGzSouK7yr/EHIXmR3A
X-Gm-Gg: AZuq6aJ2T18+TFGRB3mU5gsbWpBWYwEi5iA/D27H3sePdG9v7YSBHXRMjL4ODXP9zeq
	Cw/KgJeDKWitIOy1SmJqlLyVynl6cktsxroHoBhMafEpeEvHgdS/UTHv9NUi5xSmbSGxUX6b7qi
	3DGpZkD3/3APBP2DSKBYuAg2wVM8btW4ifynPNibWWJYQJtwu8n0HlFQUi1HyaacVmB9F+ZvP4G
	kDlY8JwXzQuTXBi2i9sNLfq2cET98RRqJvKzNcE+Zew1jk/lIqb8ZiV2TYU7G7cLIN+SBFdOTxR
	Izqzf2I9g+Uqy75slf6K0W/ULMHdhdK4pPl4IHvJFDW/YILGiWRnrYPFciyqWRUpkBVcpLM316I
	avy0s375QyrNzmZ/cVRY=
X-Received: by 2002:a05:7022:2481:b0:119:e56b:98a7 with SMTP id a92af1059eb24-125c0f95953mr6050906c88.14.1770049892249;
        Mon, 02 Feb 2026 08:31:32 -0800 (PST)
X-Received: by 2002:a05:7022:2481:b0:119:e56b:98a7 with SMTP id a92af1059eb24-125c0f95953mr6050882c88.14.1770049891645;
        Mon, 02 Feb 2026 08:31:31 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f789sm17569743c88.6.2026.02.02.08.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:31:31 -0800 (PST)
Date: Mon, 2 Feb 2026 10:31:29 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v5] RISC-V: KVM: Validate SBI STA shmem alignment in
 kvm_sbi_ext_sta_set_reg()
Message-ID: <h5ywmsqp2eysyslvh7zmuiw3mzthkiilgqv4gvjvpl6nejxs7m@ahjmnsz2c2x3>
References: <20260202003857.1694378-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202003857.1694378-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEzMCBTYWx0ZWRfX93maGxXzGgO+
 1fDWF27bMq7EORbW0hAQ3SO9YGXRhJepU2YaLYZragXMjVQ8oNmP0lbq754gUigTiAl/2CeHFPy
 Zil9cB4SUdHWFOMrhbYaRACOltWgAb/7Kz4+v+LLfkqTCUQz/ZfJOb/yjTw1dLTWqzpJEI5L/dL
 Pt8MQ9KrUfFufXsn/CMUQVUgv3k8mUEfJDWrNyz74Da5rYZXqlEzWW/ssAFm/cmL8PC/ttcMNV6
 JkLRPdPqe/3MSDKiFYnqIeonMci2HZWLWNK5rAC0E8Ee6DhTq95v+wGs3yvar/wFhmBleqwXVx4
 mfaFCMNV8o1i94n1csVgg/5teWTEkkueu7DYskgKfykzW3tcLe+PcoZDlMlTIjmCPGn7wts5n0a
 p+RNovKYzhZa73tWTFbkT0SGZa1wJ39QL1SLD6VEvV7muPhMy9JT1Ia+jibhjLEVKP2x8TYKu9W
 hD7lwGOzizWnwintOOw==
X-Proofpoint-GUID: Ig7f96sTRPWWvMeowbvbiINWdMYAmKlQ
X-Authority-Analysis: v=2.4 cv=NOfYOk6g c=1 sm=1 tr=0 ts=6980d165 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sM2csZlYJ7vdm-W6c3UA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: Ig7f96sTRPWWvMeowbvbiINWdMYAmKlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_163136_234358_5B5B0876 
X-CRM114-Status: GOOD (  12.76  )
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

On Mon, Feb 02, 2026 at 12:38:57AM +0000, Jiakai Xu wrote:
...
> V4 -> V5: Added parentheses to function name in subject.
> V3 -> V4: Declared new_shmem at the top of kvm_sbi_ext_sta_set_reg().
>           Initialized new_shmem to 0 instead of vcpu->arch.sta.shmem.
>           Added blank lines per review feedback.
> V2 -> V3: Added parentheses to function name in subject.
> V1 -> V2: Added Fixes tag.
>

A procedure comment is that you don't need to send a new revision for each
change as comments come in or as you think of them yourself. You should
leave a revision on the list long enough to collect comments from multiple
reviewers (including yourself) and then send a new revision with all the
changes at once. A couple of days between revisions is a minimum. For more
than a single patch (i.e. some longer series) a week would be a minimum.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
