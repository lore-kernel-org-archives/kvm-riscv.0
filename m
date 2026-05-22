Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B341DCD5BB0
	for <kvm-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYeePwQ40TK5IlKWMt+7RYcdyxuxbTrUdtUhDnDUes8=; b=05Q7ITXdPZ4Xqz
	qUDgSh4q85y2d8wsBu6t7A03fCuNuSnPeHfNHe5GbG+KaMVp0HRHlDYRudp0j0zk7B0M/XTHmoPED
	VFwEAH+H4VpTvjWcERuO2An/Ge6YgXFX4Ket4UgCfO5cqv+xbu1mWsd7oBMWla2PQnLDT8vN6VfPC
	zvm61AfjlgWgp0+mn8vuD/I373/wGy0a+DLpVnblgCUadM/cgGieFAzHxL31FheQiF+W+l2T7gvaD
	my2AkAv+lZNc/3dalwHV430E9soCz25LN0x6PxZ2ZwHP2CjCYgicqguW1ZAPqq7VdY/5AWgGP/DKY
	hDFUuBSFmks+BF2ndyFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPgY-0000000Av6p-1mrp;
	Fri, 22 May 2026 13:13:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPgW-0000000Av6C-0SLd
	for kvm-riscv@bombadil.infradead.org;
	Fri, 22 May 2026 13:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t65ionl8HpKaWCmZ/9penLDqAimBDJ97VFtyn/fDbHA=; b=j7B5grIHOEIOvZjiDCLedEANdo
	i4kRJn87MJLK4Gd8soCjTWZY212ayvS3nMj/8deCZ1Dz+cMbwKuICYWhfw7vTMR+oDoyywqN5pxRi
	U+f2SeczA/qJliGvvt/C8tDHeo93Up36R54I4bdq3FvZ8ZkxD8tpMWVZTSaN4ETfbrNDqhUz4xOam
	0aD7+kMN2rScgoisvS9X2LOaHNhQfyFjgs2n2FdEkoAVEqjR9u5+3nVPqKngGD8DXGflfR7NV7TSH
	mnycom5DN0HDGY2Y5oJ6xZ/NqyaxvfM+tgmLZ60c0Pdv/DnTBxbtZHLgaOUEGuVN27uzeLYwwJAEL
	9LBqQtsA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPgS-00000004OfA-2P2s
	for kvm-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:13:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8agHt399180
	for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 13:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t65ionl8HpKaWCmZ/9penLDqAimBDJ97VFtyn/fDbHA=; b=p6OYK3Lu/23dJl+e
	0Oz1t88nAjoKTeSDHwrxCEi27PR9hQ++3Lro9BrMfuNJosIARFADkp8NcZUySzMr
	fqCbN9SNad2p9QLIE2Xb4A1B/6/+XnV0Ll3JKHteEz2Ox7pDqWPVontPS/wFcIRL
	Q+evJu99SVUnmODpUNC7SECjr7vNYB8/jm++KcoC/nonEthZv5I9lP8H2IZpLR7/
	gzfVJcUm+zxjYKrvJWAU+lexfrQVBnOta+FpxLIhpgOYtbGw2IbfMhMg27JpwtRn
	F0MS+DmBNIJCvFXAmKfD+Lzph7b1/CxAKEyoC6hnVlI2LQ2gpZDAokg8l/9gwxai
	zmimwg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9vdgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 13:12:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so2824329eec.1
        for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455577; x=1780060377; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t65ionl8HpKaWCmZ/9penLDqAimBDJ97VFtyn/fDbHA=;
        b=g/dplB2i285LjbOp/z37Y4grode9QH8UOA+wNDmuDOKB3sHoVA+OghSi98OUEB3O9j
         PflAmff9OLQM9fgrZVPqqsvVhl05bJ7qMKQSJ1vN9A4U2hO5ZS+RdwdlBdLDkkue2meb
         BSCVBAFm7OjGOKQBcs4XkIryQjyBLMeXmaO82gNlkig7YiHfp10nXbMRmMoL0iFVRjZR
         Rsiy9vYOVJ8Uureevz7zpBM/MMwtzHL5fjyUNLOWAG6Kwo+IuYzUWzmIjgsiip3nMtsg
         wVmFc7q8EYjIZSfjxasYlHDkbhlQ2YqVRb6aYOSccQxr4w52ACwDxJ5U190iTby66XFQ
         mWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455577; x=1780060377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t65ionl8HpKaWCmZ/9penLDqAimBDJ97VFtyn/fDbHA=;
        b=mq/lV+GgvVCHPZQmJAi3Ys6SQ8RGARuqAuvMji/W/AUVvH+bOlBXwp7BsWmHrLlGIL
         WunulSPS6d4W7arky/pyagpEAu05llmvoGAQIE8Zj+krRg5cTABGg1IDWIHx+tUVKwN6
         rAw6WmK7gwsKGnkZMJ7V1cbFWUNIiufKARfumcHB1dvNWjqMukjTbgIGJ7hw8KCxvhn+
         5XfgHBopvduuQxmydFLQSYmk9ox7OrdMuNhgS3KWCQ8FtT8QqsGooIxYQndjr29wqmlI
         I0c+CoWp8bS/NKFUEXsJ9EH8XLULSwPoDsV8YAag0qavIamK+/+ScwjWqJ2VtcO/iHfo
         E47Q==
X-Forwarded-Encrypted: i=1; AFNElJ+FBmWl8W09EERuEonS82toAJ/JgRso2s8hH6hQaiSXgyg2swuldxDj+tL7HU/xibxBmh5cBPMEbzQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+13/v8AyLr+/W5Eipvi9wJTCEa6ZxAiI8NfB7hoygyjTpkwcK
	XE9A4ebGgaTNuKvpcb/dxzYnvYYduv1BAIvPo6nHjGXP4DCWWqwaKMMhmJ/b6lutLtROocrLRD/
	yUpyB+MrVgF7nQuT8H3aB5USHFphIWyPu2u78uMIL5bPbdQMTrovcmFxRJzbb9K7BVSdy
X-Gm-Gg: Acq92OGSOOTUg8PmlVdZnnXM0z/wl51gNOK3VlVnbnNcOkDcy1yyYWdN3MJd8p2vJNK
	16suhOHP+tIhTUXH8N/kTzDCMg2QEq5aVTn0CWmJyZSH5ZGBH69qoB6rzq2rp26Rinq1Z6p8JH9
	p5Z164uIAYsvBemseIG9QgRyzHqwl9ItdJIJVtPkZ2354eGvLPRXdQoQ7w6rVZiAd3uXuQNFxxi
	1wLYiv6czXGOlJn8pHrofr+w1MVIrfuY9oL15M8Ik4t45IlfZNIeI9q3gVxAcQbsRwBQ+anvlUD
	vZMdlpJCdxfMgwDe3K31FSudHylbYq/Xb6Oq6zQsHPCsQooefHhs4O/ArgJva5BEBUz0XcTVeR4
	FwPyE4/pmEUsJIUQkNT3eSw+Ydv/Zb68=
X-Received: by 2002:a05:7300:ad2d:b0:2c7:ea98:d94 with SMTP id 5a478bee46e88-30448ffda4emr1702414eec.2.1779455577509;
        Fri, 22 May 2026 06:12:57 -0700 (PDT)
X-Received: by 2002:a05:7300:ad2d:b0:2c7:ea98:d94 with SMTP id 5a478bee46e88-30448ffda4emr1702391eec.2.1779455576994;
        Fri, 22 May 2026 06:12:56 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f1fe3esm1328524eec.7.2026.05.22.06.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:12:56 -0700 (PDT)
Date: Fri, 22 May 2026 08:12:55 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, jiakaiPeanut@gmail.com,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend
 handler
Message-ID: <rqpv3mrcsxxdlaedbckb26bf5vfkj3xgd6m26me24nf4tbcqtb@jh62r2df3ur7>
References: <yirnowpcfq6wqru3jshbbaicqftfj4ef3dcss65jdtuon6nzml@iyv45tnmmfha>
 <20260522031813.3429490-1-xujiakai2025@iscas.ac.cn>
 <y2nfuwydbx4wxk3optxr5bex2pubo5whqvk2bzsl7os2kdkwaq@yk36oa4kozfh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <y2nfuwydbx4wxk3optxr5bex2pubo5whqvk2bzsl7os2kdkwaq@yk36oa4kozfh>
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a10565a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=z0nQUa4Di5ar0o3MZ30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: XqtdffyRDHCgTmbMG-W8Ohqkxv3UtwLJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMSBTYWx0ZWRfX3nRW+jY2kbRU
 PC2lJK5ib52po8+vyP7ZGuvAcxm9O1VVZaEuWGt0jK7nue86Rx8WWHxqO1/vjqVPDTfx1tArRzr
 SkzwOSkAmbqOEbGjX0QEwfn/AwZlHmmJNLUInWkAHksHx1nYNbVsFux1WktQr949dVzwmGuY65x
 G+qg2vHptb7etDEA9JZFMR2s9KDmc9eLBt9vxVtc2iyzsdvb9voBpO4PuNEgrbZViwR1ffLwcLm
 VGntNIRc/KTVI4c8qb4GyiKKMFRDW2QwOqYJ/hERUTYzQdJazN2UZTcum/UVdyZsnr7GSJI2Trl
 1x2+u34a6sZlLbNRsW5U2s660KAz7eDSAmwt3EXNWwqyq08crIPYbMnZIUTEDeVs46Yw5z+ehv2
 cOmde/O1Yi9+pTcuXrGRGsiRA5QRz2KU0fkmUFUw8jagqMinw3SZ/cFkTFVK8dSCqlnNnVlWKnZ
 toro0ytf8SgdRXcwXNw==
X-Proofpoint-ORIG-GUID: XqtdffyRDHCgTmbMG-W8Ohqkxv3UtwLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_141301_254146_5A8BC6FF 
X-CRM114-Status: GOOD (  22.35  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMDc6NTA6NDNBTSAtMDUwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIEZyaSwgTWF5IDIyLCAyMDI2IGF0IDAzOjE4OjEzQU0gKzAwMDAsIEppYWthaSBY
dSB3cm90ZToKPiA+IEhpLCBkcmV3IQo+ID4gCj4gPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3IQo+
ID4gCj4gPiA+ID4gSSdtIG5vdCBhIGJpZyBmYW4gb2YgdGhpcyBhcHByb2FjaCBhbmQgSSBzZWUg
c2FzaGlrbyBmb3VuZCBpdCBoYXMgZ2Fwc1sxXS4KPiA+IAo+ID4gSSByZWFkIHNhc2hpa28ncyBm
ZWVkYmFjayBhbmQgSSB0aGluayBpdCBtYWtlcyBzZW5zZS4KPiA+IAo+ID4gPiA+IEknZCByYXRo
ZXIgd2UgaW50cm9kdWNlIGEgbXV0ZXggdG8ga3ZtX2FyY2ggdG8gc2VyaWFsaXplIGNyb3NzLXZj
cHUKPiA+ID4gCj4gPiA+IEVoLCBub3Qgc3VyZSB3aHkgSSBzYWlkICdpbnRyb2R1Y2UnIGhlcmUu
IFdlIGNhbiBqdXN0IHVzZSBrdm0tPmxvY2suCj4gPiAKPiA+IEkgbG9va2VkIGludG8gdGhhdCwg
YnV0IGl0IG1heSBiZSBub3Qgc3VpdGFibGUuIEhlcmUncyB3aHk6Cj4gPiAKPiA+IERvY3VtZW50
YXRpb24vdmlydC9rdm0vbG9ja2luZy5yc3QgZXhwbGljaXRseSBzdGF0ZXM6IGt2bS0+bG9jayBp
cyB0YWtlbiAKPiA+IG91dHNpZGUgdmNwdS0+bXV0ZXguIFRoZSBzdXNwIGhhbmRsZXIgcnVucyBp
bnNpZGUga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oKSwgCj4gPiB3aGljaCBpcyBjYWxsZWQgZnJv
bSBrdm1fdmNwdV9pb2N0bCgpIHdoZXJlIHZjcHUtPm11dGV4IGlzIGFscmVhZHkgaGVsZC4KPiA+
IAo+ID4gVGFraW5nIGt2bS0+bG9jayBpbnNpZGUgdGhlIHN1c3AgaGFuZGxlciB3b3VsZCBwcm9k
dWNlOiB2Y3B1LT5tdXRleCDihpIga3ZtLT5sb2NrLgo+ID4gU28gbWF5IGJlIHdlIHNob3VsZCBp
bnRyb2R1Y2UgYSBtdXRleCB0byBrdm1fYXJjaCB0byBzZXJpYWxpemUgY3Jvc3MtdmNwdQo+ID4g
bXAtc3RhdGUgb3BlcmF0aW9ucy4KPiA+IAo+ID4gV2hhdCBkbyB5b3UgdGhpbms/Cj4gCj4gR29v
ZCBjYXRjaC4gSSBzaG91bGQgaGF2ZSB0cnVzdGVkIG15IGluaXRpYWwgaW5zdGluY3RzIHRvIGlu
dHJvZHVjZSBhIG5ldwo+IG11dGV4IDotKQo+CgpCdXQuLi4gYmVmb3JlIHdlIGdldCB0b28gY2Fy
cmllZCBhd2F5LiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCB0aGlzCnJhY2UgcmVhbGx5
IGxvb2tzIHRvbyB0aGVvcmV0aWNhbCB0byBqdXN0aWZ5IGFueSBjaGFuZ2UgYXQgYWxsLiBEbyB5
b3UKaGF2ZSBhIHRlc3QgY2FzZSBpbiBtaW5kIHRoYXQgY291bGQgZm9yY2UgaXQ/CgpUaGFua3Ms
CmRyZXcKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
