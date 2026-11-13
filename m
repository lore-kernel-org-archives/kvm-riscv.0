Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1110606A31C
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JnwpFmgS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kz71YDOC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fcfz4RdS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K2ia2ZvU0u+Ff9VcYTkILlJYFJaeayZxQy/tFLqOkv8=; b=JnwpFmgSQOdneKCLbY1ybA8lNq
	qsWPukODDfsbrrkqoJDl+2u3y8kEjHcvhQEQ5xVvhQ4BawIOBYS3RgEJzZWtR8RvKzOoNutkTTSBt
	4qogLGo/z1Ww4AVNtRuRd7FrnFhZwe4piB0lWbwaoK1IpnbQlQoyCsp0C8O9iy9rmEvAHnjyoQnh2
	f6abWkyITjeGeHxG1A+3BThzvdPUT7A3i0Hk8fBtDzNMbhRBNBQypYJsDpEeuIw/E+RjVWVpYbvGb
	oV48H5aB9U33cm26syxVOJspxhZ1iD/xHEvo6coMaM4OUcfiSTEl6pqMM4ZXgjLo/8wMDNC5N7yo4
	BAwOa4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmE1-0000000ByGN-0g2Q;
	Fri, 13 Nov 2026 08:01:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmDS-0000000By6V-0Kpj
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:01:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57AU73717472
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 08:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=; b=Kz71YDOCG6MGa4OO
	omCac5hqmQ8LB6GGuYtwxpMC8O5C2E5AgJCvsmrKeQXyNvJIuHbIMTCwUTUmmoPp
	dBpjqftP24hkxQp5YR6oxPSajBE64d6hxGD2nJ8pjqIDtYmzySzzmLdA/iXh/eAH
	/rnXG2CIi57BVkDsZsRCUPtXF8YX1EKQLpiOR3b6oenFbanMvu0T34Ne0/3x+kAm
	r3t3tnr2KZBmoB4pkvQAxHTXAYOePUnU5Q02J5XGJVuf59h4SEOdmlDdiRTJf3EC
	cxFXjaVocK+D0o+mAsCzMcIUxj9/KkcoPadzhdCunDEzqx1pZawYVNoMoplsJR3n
	ukoKzw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhd7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 08:00:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so2440149eec.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 00:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556855; cv=none;
        d=google.com; s=arc-20260327;
        b=ROw+cSq9WAPJCgPCaZaJbcEFCFjYSVllzWbOgpLZNTipBXtdTiCG/UPMldXRct0Dcb
         9lOzG8YA8/E7RpjhW9huhhv+xmKcFjjJz740dBorMwHRX2mOpItq71ZEs99bdl//Smpu
         j5KxBJztHONHxcIYE5wvYVSHpVD+quYf2kU85cAJ1boIic2pyhNd1goju+hiKBkeffYM
         hBQIREm+tLrw/z+/BLdJEPtviYjW9kD71ePK1th3PaaAVnvKd7zsL/JaUj7wnOBvJtsz
         E3O+TILYS8LAYT+ZYF2JY6id44RfXiX605i/NDbqI9H2ctTbZGP6v1Go/UjcoZ/dXPDN
         7wOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        fh=xmmf30abbJAoG2KtvM49cs0f1Nyc4felESoDrNMMlks=;
        b=XqSAAHXZ14CwBoW6YNKNwmEFKlc0cC9yOhwWpAaNfpp2/qJ6AmW72pMHHKfBU0RLg7
         0NAFrKvK7/UZkRcrvzx0x/EWpSdsVNELgEqXXN7kjJTUOPXAYUrwa0hIEdU+EQlLTN5R
         chG7kug2MRggP7JOmSJO4wRbx0POqGzeQe0V1vit/X5VMgpqWnOMeCTEGDiZqwWkGqwQ
         U55sxtLu3DQnQAnyoyCWdiPN/BGDETqoUYPkahS5nVcLmi3aQCwcHiNopxnZF5R/x7XL
         AcpKHrxPBvvJYipttFxuMSn63u5sKGwNQ+8uD87Uf11zqpLrRMueZIE6n/Vn6k/0IKKa
         M5cQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556855; x=1795161655; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        b=fcfz4RdSC1UvpybcesXYCuHKZZQdPMSaC1HgTnfus97ULGZOh24Jp857Ht5tctVwkY
         1pWmN30h99cdRfY5TXIItEiafWbtip8XOvIUF+Y5JwNV0u+YoadeoYQpAi9mjF1Pq3qG
         jgqYry1SWYOzlJM2Wggi0XPGnTL3Z3/2CoDUME8NLyT8qQfqDCCbgLaiQxq5UpTXV6tA
         RrckYbyBh9/3Xdn2cuu7WkaJU9fMH3K8/7Fvt89e9SotaZH/4pMWf55mcP5yBKLrri1p
         VpyoSitzBoh9C5n4Ois6rFw0Ot6tigrFL4YlISsLm0cmu3V7+E8FHvmnwgBkmEfJx0IK
         aFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556855; x=1795161655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNM0+Gbs89qhYCIsRWQ2+LM6nKtUULmAfqDYB/OAGfk=;
        b=tn+gV9CeQTJg3VShTBaXOK3ugktcZXqsMi9d5BJtOZRB7gbW9RYbNN6XMVnPKgNjIH
         dI4H92b7fT09UfxS0LNPV6a1hvGxSXRtGPsQ6nHS9VnAOyFKkWp65+7+SMiJLnvGM0dY
         c6XdfyUGODiD2N9ALPn5qvY5QgWadXQYnGRiSkz581JbXDoWcjq06yoKKWHHeXZisSwE
         EcTBHfU4q4sDCVnTfklKTMVAhl4MCY3JtGT/5noZ5pR3+3w4RrTKaOoISBLbMOCCEaIg
         Te4grxBrLKugRF2D58DIyM+YhXolPg4zMDvJfsvhLgcmh8lANfDo8OHJGSCDmCX6SnrO
         qOPA==
X-Forwarded-Encrypted: i=1; AL+hErG5ZVxjDN63o7igAEUTQ8qYau5pvM4AKXsOupovcljm47u8j+E6KzJW3lEGjJ49wbAZGgc6CgZIsIo=@lists.infradead.org
X-Gm-Message-State: APuU4Z/MyeN9XCBZ7k7Vi703QhDOOycF/Rr1XKuvjwfKetvQwshD67cy
	kGyBpFcZwb4MSyI8KQ5lGsTrso2Xaok0VMVjEwerfRd28pOkTSJvU+tjsR5QSUwIuehDGT4e9gF
	s/Ca6rfcjKAoPVPKc2+PeUylveO8cUpoQW0rr8VrmpSHwP8/IEg7PYFXTri5ilOYR6Py790ZgZj
	msKPQ3r5quvAm7rL69UfErdwpKtjBkA+/Gz57bhz1zKzY=
X-Gm-Gg: AYBFou0a94lSrP8SOt62Ra8HFx6GNixRAR68F3GgA+MYveqC0UL5UguF9TMC5q0LpDO
	wEjx4v399hGq1l59LQBjJNedqQhxaHpWlSvsYmJ+TZ4fq194m1ttBSjnQJXs0AKmnHBXR0iJFEv
	7OxZTMt00ZlhWwLwziJCOHwBUlmsmTKTctPoPTmRhHdeW1/k4mhnje9hjeIr0=
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr1454878eec.25.1794556855253;
        Fri, 13 Nov 2026 00:00:55 -0800 (PST)
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id
 5a478bee46e88-37966766d98mr1454857eec.25.1794556854546; Fri, 13 Nov 2026
 00:00:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
In-Reply-To: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:30:42 +0530
X-Gm-Features: AclHuK9I8L1Jkoa68vnSH3mJyt49oobnf7EDpmkY2TDzdHkp1PyujMbXCJ4T8rI
Message-ID: <CABBgwmuBBbyBytwRBTeAqF=0c1m+TFK8E3yPopGNQAsrMFO2vg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Proofpoint-GUID: zFIuNYBpt3L3orDb6JV6drO-6BDd0nWA
X-Proofpoint-ORIG-GUID: zFIuNYBpt3L3orDb6JV6drO-6BDd0nWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXwkV8UfP5jawd
 YsNwHUMOrUwYyesdvjOmHTC6ryeB/jlwxnKyEicmzZhpsapl3UPGa07y3K4bMv2GXzfaUHU7qXW
 2da1WOWCrDdVyhY8ZQaOyK1t90kwVR5FmQV4/Vx/OHx5onmGUgQoFIHlVwMP9jMMaWt+Y/EmlCZ
 6MPVVwGNNyfwCUmi+G/GdK/77TCrB1hytTPK8+vdIBwicU/sdrh/Y1t+uaEJxGNYRA1wLdUy2s1
 cKOSTjCeIrw1olNVzIbwAdSSXZLD7BDwG1dNAx7+R21w5mvT9EVPte6kihI5xf2yN7KiXZFskRS
 LelFjPZA/Ty0M5fgSBoh73JeG/EYqZy3ZEhib14D+qUyAquKcCZ6w3J34umAC1StnBXInqMaTgs
 o6spxjcDvFBb4TGarUs62C5RQGZ8Zz/pnhaV/SFKOJ6ANeAq9M+bINr1kaqzaMhCDPwxH5EkT28
 +QmTIDjWnEZ45cX6Aaw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6c3b8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=loDQXBK_udfRwOWNHxcA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX2Jimu2SxVe8C
 VCIPajYtFwGF+eIPRnuiAgMJbRlSKuitbzPrqWhLuDskM7xFO0pZlL3cxBTS1GY5lpsP9DWMJHI
 tbRcdGTMdjx18Lzr2YpmdM7gzp6ZF64=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_000058_711150_47E391F0 
X-CRM114-Status: GOOD (  34.30  )
X-Spam-Score: -2.8 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgNzo1NuKAr1BNIE9sZWtzaWkgS3Vyb2Noa28KPG9sZWtz
aWkua3Vyb2Noa29AZ21haWwuY29tPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNp
Y19pbmplY3QoKSB3cml0ZXMgdGhlIGludGVycnVwdCBpZGVudGl0eSB0byB0aGUKPiBTRVRJUE5V
TSByZWdpc3RlciBvZiB0aGUgdkNQVSdzIElNU0lDIFZTLWZpbGUgd2hpbGUgaG9sZGluZyB2c2Zp
bGVfbG9jawo+IGZvciByZWFkaW5nLiBUaGUgbG9jayBrZWVwcyB0aGUgVlMtZmlsZSBmcm9tIGJl
aW5nIHN3aXRjaGVkIHVuZGVyIHRoZQo+IGluamVjdG9yOiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1z
aWNfdXBkYXRlKCkgYW5kCj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3JlbGVhc2UoKSB0YWtl
IGl0IGZvciB3cml0aW5nIHRvIG1vdmUgdGhlIHZDUFUKPiB0byBhIG5ldyBWUy1maWxlIG9yIHRv
IHRoZSBTVy1maWxlLCB0aGVuIHJlYWQgYW5kIGNsZWFyIHRoZSBvbGQgVlMtZmlsZQo+IGFuZCBm
cmVlIGl0cyBIR0VJIGxpbmUuCj4KPiBPbiBSSVNDLVYsIHdyaXRlbCgpIGlzIGZvbGxvd2VkIG9u
bHkgYnkgbW1pb3diX3NldF9wZW5kaW5nKCkuIFRoZQo+IHRyYWlsaW5nICJmZW5jZSBvLHciIGlz
IGRlZmVycmVkIHRvIHNwaW5fdW5sb2NrKCkgYnkgdGhlIG1taW93YigpCj4gdHJhY2tpbmcsIGFu
ZCByd2xvY2tzIGRvbid0IHRha2UgcGFydCBpbiB0aGF0IHRyYWNraW5nOgo+IHF1ZXVlZF9yZWFk
X3VubG9jaygpIGlzc3VlcyBqdXN0ICJmZW5jZSBydyx3IiBiZWZvcmUgdGhlIEFNTywgd2hpY2gK
PiBkb2Vzbid0IG9yZGVyIGRldmljZSBvdXRwdXQuIFNvIHRoZSBTRVRJUE5VTSB3cml0ZSBjYW4g
c3RpbGwgYmUgaW4KPiBmbGlnaHQgYWZ0ZXIgYW5vdGhlciBoYXJ0IGhhcyBvYnNlcnZlZCB2c2Zp
bGVfbG9jayBiZWluZyByZWxlYXNlZC4gSWYKPiB0aGUgb2xkIFZTLWZpbGUgaXMgcmVhZCBhbmQg
Y2xlYXJlZCBiZWZvcmUgdGhlIHdyaXRlIGxhbmRzLCB0aGUKPiBpbnRlcnJ1cHQgaXMgbG9zdC4g
SWYgdGhlIEhHRUkgbGluZSBoYXMgYWxyZWFkeSBiZWVuIGhhbmRlZCBvdXQKPiBhZ2FpbiwgdGhl
IGludGVycnVwdCBlbmRzIHVwIGluIGFub3RoZXIgdkNQVSdzIFZTLWZpbGUuCj4KPiBBZGQgYW4g
ZXhwbGljaXQgUklTQ1ZfRkVOQ0UobywgdykgYWZ0ZXIgdGhlIHdyaXRlIHRvIHRoZSBWUy1maWxl
LCB3aGljaAo+IGlzIHdoYXQgc3Bpbl91bmxvY2soKSB3b3VsZCBpc3N1ZSB2aWEgbW1pb3diKCku
Cj4KPiBGaXhlczogZGI4YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBpbi1rZXJuZWwgdmly
dHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIEt1cm9j
aGtvIDxvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4KPiAtLS0KPiBXaHkgUklTQ1ZfRkVOQ0Uo
bywgdykgYW5kIG5vdCBtbWlvd2IoKToKPgo+IC0gU2luY2UgdGhlIG1taW93YigpIHJld29yayBp
biB2NS4yIChlLmcuIGNvbW1pdCA2MGNhMWU1YTIwMGMKPiAgICgibW1pb3diOiBIb29rIHVwIG1t
aW93YiBoZWxwZXJzIHRvIHNwaW5sb2NrcyBhbmQgZ2VuZXJpYyBJL08KPiAgIGFjY2Vzc29ycyIp
KSwgbW1pb3diKCkgaXMgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIG9mIHRoZSBzcGlubG9jawo+
ICAgY29kZS4gRXhwbGljaXQgaW52b2NhdGlvbnMgd2VyZSByZW1vdmVkIGZyb20gZHJpdmVycyBi
eSBjb21taXQKPiAgIGZiMjRlYTUyZjc4ZSAoImRyaXZlcnM6IFJlbW92ZSBleHBsaWNpdCBpbnZv
Y2F0aW9ucyBvZiBtbWlvd2IoKSIpIGFuZAo+ICAgZnJvbSB0aGUgZG9jdW1lbnRhdGlvbiBieSBj
b21taXQgOTE1NTMwMzk2Yzc4ICgiRG9jdW1lbnRhdGlvbjogS2lsbAo+ICAgYWxsIHJlZmVyZW5j
ZXMgdG8gbW1pb3diKCkiKSwgc28gYWRkaW5nIGEgbmV3IGRpcmVjdCBjYWxsZXIgd291bGQgZ28K
PiAgIGFnYWluc3QgdGhhdC4KPgo+IC0gUklTQ1ZfRkVOQ0Uobywgdykgc3RhdGVzIGV4YWN0bHkg
dGhlIG9yZGVyaW5nIG5lZWRlZCBoZXJlIChkZXZpY2UKPiAgIG91dHB1dCBiZWZvcmUgdGhlIHN0
b3JlIHRoYXQgcmVsZWFzZXMgdGhlIGxvY2spLCB3aGljaCBpcyBmaW5lIGZvcgo+ICAgYXJjaC1z
cGVjaWZpYyBjb2RlLCBhbmQgaXQgaXMgdGhlIHNhbWUgaW5zdHJ1Y3Rpb24gbW1pb3diKCkgZXhw
YW5kcyB0bwo+ICAgb24gUklTQy1WLiB3bWIoKSAoImZlbmNlIG93LG93Iikgd291bGQgYWxzbyB3
b3JrIGJ1dCBpcyBzdHJvbmdlciB0aGFuCj4gICByZXF1aXJlZC4KPgo+IFNjb3BlOiB0aGlzIG9u
bHkgb3JkZXJzIHRoZSB3cml0ZSBiZWZvcmUgdGhlIGxvY2sgcmVsZWFzZS4gV2hldGhlciBhCj4g
d3JpdGUgdGhhdCBpcyBhbHJlYWR5IGluIGdsb2JhbCBtZW1vcnkgb3JkZXIgaXMgZ3VhcmFudGVl
ZCB0byBoYXZlCj4gdGFrZW4gZWZmZWN0IGluIHRoZSBvbGQgVlMtZmlsZSBiZWZvcmUga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZSgpCj4gb3Iga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2lj
X3JlbGVhc2UoKSByZWFkcyBhbmQgY2xlYXJzIGl0IGlzIGEgc2VwYXJhdGUKPiBxdWVzdGlvbiwg
c2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1haWEvaXNzdWVzLzE3Mi4gSWYgaXQK
PiBpc24ndCwgdGhlc2UgcGF0aHMgd2lsbCBhbHNvIG5lZWQgdG8gZHJhaW4gdGhlIG9sZCBWUy1m
aWxlLCBhbmQgc3VjaCBhCj4gZHJhaW4gZGVwZW5kcyBvbiB0aGUgb3JkZXJpbmcgYWRkZWQgaGVy
ZS4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCA3ICsrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBpbmRleCBmMTdk
YzU1OWE3MDkuLjgwN2JiNzNhMTI5YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFf
aW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTEwNTYsNiAr
MTA1NiwxMyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCj4KPiAgICAgICAgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+PSAwKSB7Cj4g
ICAgICAgICAgICAgICAgIHdyaXRlbChpaWQsIGltc2ljLT52c2ZpbGVfdmEgKyBJTVNJQ19NTUlP
X1NFVElQTlVNX0xFKTsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICog
cndsb2NrcyBkb24ndCBwYXJ0aWNpcGF0ZSBpbiBtbWlvd2IoKSB0cmFja2luZywgc28gb3JkZXIK
PiArICAgICAgICAgICAgICAgICogdGhlIHdyaXRlIHRvIHRoZSBWUy1maWxlIGJlZm9yZSByZWxl
YXNpbmcgdnNmaWxlX2xvY2ssCj4gKyAgICAgICAgICAgICAgICAqIGkuZS4gYmVmb3JlIHRoZSB2
Q1BVIGNhbiBiZSBtb3ZlZCBvZmYgdGhpcyBWUy1maWxlIGFuZAo+ICsgICAgICAgICAgICAgICAg
KiB0aGUgVlMtZmlsZSByZWFkIGFuZCBjbGVhcmVkLgo+ICsgICAgICAgICAgICAgICAgKi8KPiAr
ICAgICAgICAgICAgICAgUklTQ1ZfRkVOQ0Uobywgdyk7CgpBbm90aGVyIGZlbmNlIGFmdGVyIGV2
ZXJ5IHdyaXRlbCgpIGlzIGEgYmlnIGhhbW1lciBpbiB0aGUgcGF0aC4KCklmIHRoZSBpbnRlbnRp
b24gaXMgdG8gaGF2ZSBjb3JyZWN0IGNvbnRlbnRzIHdoZW4gVlMtZmlsZSBpcyByZWFkIHRoZW4K
YmV0dGVyIHBsYWNlIHRvIGFkZCBhIGZlbmNlIGlzIGF0IHRoZSBzdGFydCBvZiBpbXNpY192c2Zp
bGVfbG9jYWxfcmVhZCgpLgoKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAgIGVp
eCA9ICZpbXNpYy0+c3dmaWxlLT5laXhbaWlkIC8gQklUU19QRVJfVFlQRSh1NjQpXTsKPiAgICAg
ICAgICAgICAgICAgc2V0X2JpdChpaWQgJiAoQklUU19QRVJfVFlQRSh1NjQpIC0gMSksIGVpeC0+
ZWlwKTsKPgo+IGJhc2UtY29tbWl0OiA3MmQzZmNmODAyYzQ1ZDAwYjMwMGYyNWI4NDhhOTNjM2Ey
YmQ3YzdlCj4gLS0KPiAyLjU2LjAKPgo+Cj4gLS0KPiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4g
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
