Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FBFE83F1F
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w15hrMVvgdGEtrk2wKkS0tprd/bwUZopGtNKfe9gcgM=; b=pysSWqZgvf1mst
	DcbGzOfk60s+4/u3FFK/scdWY9ovdLCzWdfl3mXVrVXDRFOg16iiK/wCyB7mm9cL6aPLw0r8VhnjV
	ovXT8KRSK71HucB620bnGvj4/2CB1YHLGyvt7Yez8lQV7cFB1cSys6StbiIBb+au0nwqqdWdy+HmY
	PlKGBWUgjus/7GKfsJBVFx/IJySEl5FagFuiauW5WZaf60e9ZfDovt9Yt+/EE3SAeH5uf4lSgOgkf
	N84zcGL1vK0/+ksbz9kvPPE2+uWFuWhcsLwU1x4xsx76rHeCsri9/2azTQynIkSlEf9KJ0wnyHXk+
	uw43GHkuG3pslVuSUDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0lf-0000000A3Wi-39MQ;
	Thu, 05 Feb 2026 14:55:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo0lc-0000000A3W5-3qrH
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 14:55:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615CgcYZ4166459
	for <kvm-riscv@lists.infradead.org>; Thu, 5 Feb 2026 14:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQsqX44DUNzihTZKDnTdc2J2
	cKiScOMC8GyFnzDeQdU=; b=WdK8KA6baec4m76KEECT2zVxe8SZ7JvZaJ9yFrOn
	fmV2o8AhuMaDKJwSADpXWAMWTO106dSvfkOc7ylxlQubQECRAQZGkOClpfhjJ5Qa
	5iFSLMpiTYdGiXDdXAC4hEz599HV/KYvluRTUApNmJRMUs+Txf3DoV3khYtphzUJ
	rz3PHkl8IzsCXguF4Rcnpl9Re98FEicdKMSFArN1gDOUsXUJ6kItIM7v9UGAcprv
	AmqkTVbq1nKFohXIql0YD4qWU3rTw65Ll/dL+GU6cN9h8xFn6uuCpPOAFEWUp06x
	7HBS9yOSxwDJISL5oM9ipVK+Z90XL1AxvLBOTVyD5lPvEg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg9m5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 14:55:32 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45f104c0ef1so3064783b6e.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303331; x=1770908131; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQsqX44DUNzihTZKDnTdc2J2cKiScOMC8GyFnzDeQdU=;
        b=WxxKL9RQd8Jrk95X87MOyzWcOp+a5a6VOdVpnG3UsqdAZnsJLQNt/sIAcngvW8l/HF
         DPV6tfbTpM4/6ERYWNZwJ0VQS89RqPjgAPHywpws0097idqzhGI5cAGXjr8bQrMqZ/pH
         bXfws20sybrdfLD3nu8rOr2izuzM/D0EGtIuXW1+xhLX/+TjNbUzf7z7eaAONLfWZLKw
         OWACuWvz4/jT9MQ8TL/ckACNmw7Fw1N1uUOxjBbs+2lz5itceTivZXb7oZiWrBr0zBpZ
         0VDZywwBNBnanh3O6MeJPiSTOkwZa0gArMN6bfoXqyzC6ntQ7EMwnbJT5FLETttA3SW3
         7hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303331; x=1770908131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQsqX44DUNzihTZKDnTdc2J2cKiScOMC8GyFnzDeQdU=;
        b=nOFU6dgGXOtma5+rSlR0RJzR5uY2M2LBIBViVCJzanc5kZtERinHZzWISAmPyL+5H9
         Xt7QPIy/cpmtnGx0I7mDY+GvI+9InqB0pi/H0fp2QkwuSemV/f/npsDpEOLw9wMdsNGQ
         7XpVlmABpKC4U6xXbZIAEQaIi3TbCkHHzlJ3ez5qzegQLJ73Xwe3/Q1QHN2JAsAtzxqz
         bqVvi0uxjrXMKjFp3A+H1+nFBOmwLx+vTLcww3J+vp+SNEm74K3GP+1UjQNCns7rBzxj
         gRT3n6UdY52ZDxMEjvnMErzYwl3af+WxvQdlS/q1RFOqLs1dq+VZzs3hzQgd9lSIo+K4
         uISQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6e3uR8ujjxl99GWycu+NezlrNciX4h+esUSknVrasvFZJEjd1EBCGDMhcuwXBiB2/LhFzrG9iWVA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlduyZK+QHKsxcHnd8zSmuEGqN69jWNp2RUeX06b4E6cWPgrem
	Lz2Wd9wKf9tt075pF9FI7SVm2URmy3Gzlu3fWIdVx90Az3Jthf3XLzMS4TShEq5kmRB7Uo+JNbG
	U/vFFAlAPFPoqG8gksvTbJSiLGbh2DsgjrYDjNCGiDuv1RO6rvht/w0Gq1t2klDv+m5Sz
X-Gm-Gg: AZuq6aLEjiXDWluAqK7JfO35GPdWkMQnQNy1NSUKbXRZZNWiDZhVN7A2+hWcsLBqshe
	wFGmcE4WtwP/q0nJ+1Olp27usl45HiRKpYQtx0VLaZFsWbQbnWxav1mPk5EtAe7T5zGcAQ9+CKB
	hUuOMqkNTYe/U3tufjthEVt2uxisMOYrx4+u/mtKd+PKIJT8jBpwAUhq7EHiLuRejNvP8ct+RaW
	/F+bHPIvnbLHQ94FMAEiwWQt1OMgMI7HHO/5azug19gMwgk4piFd4T3vBCko+/cPErR0kWMzSx2
	kBt90Ov+CwXSkvDd5VnTeW/UriwYJDdXHbfyqWtDekmVL0JX0ux8gbf1S1Qc/W7pT8hvxtxQXLn
	Ba9g5uReIR41QrbWbkvQ=
X-Received: by 2002:a05:6808:4f64:b0:450:ca65:ef60 with SMTP id 5614622812f47-462d5a2ea64mr3150895b6e.39.1770303331625;
        Thu, 05 Feb 2026 06:55:31 -0800 (PST)
X-Received: by 2002:a05:6808:4f64:b0:450:ca65:ef60 with SMTP id 5614622812f47-462d5a2ea64mr3150874b6e.39.1770303331218;
        Thu, 05 Feb 2026 06:55:31 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-462d67cf83esm3226817b6e.16.2026.02.05.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:55:30 -0800 (PST)
Date: Thu, 5 Feb 2026 08:55:29 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu,
        atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        pbonzini@redhat.com, pjw@kernel.org, radim.krcmar@oss.qualcomm.com
Subject: Re: [PATCH v5 3/3] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <uqklo2bxvs6v7kg2yotmzbba7x4r3evmqlj3gubwiptrimy2es@dtl3rtmclwso>
References: <ocfqo4zpsg6yyaz6kd65jrvudtb35uerdsueazqdk6w7c5lvdf@wvwzhc57gxez>
 <20260205012808.98973-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205012808.98973-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMiBTYWx0ZWRfX4UHwWIXWPgp7
 +FrXNuU3qLaETMRIdp82TX9Q3cA/XiwdaNgewfORfy4ohv2PeNEsGPUHd3hYv0aQx6alBlwpG2c
 i9tHlSg+OSOgevbj718KASbQbtfbGG0qC9zv1Y+tTCM6aqdVVSpMDXy2vfiRJv3rF+jTtIamNPQ
 RuJcF+6YK/oL7PEopAqb3ZUBFjHbRLEOTRq1cL98UEThjgwoq1tzvTDxyJWanqjH+8vt/rA0dNp
 O9R03waPZQGJxtpwX+qdknkm72XAjIXes8WzKjbJAg8H8fIFqjj/wvC02+foVS+Rz1/IFiJBzFf
 64iObfPWglb/YSYC/ewjSFNcTRLVpN7pn4dua4MQHBCiQHEZvTxFlWotiKVbj0/+PrFojczQl6B
 bIDtLzw4qylcf+1XsFBTy4S5f4+QwCfeJOnguJwwdaFF6l62JXCgeisD6dsEq++vmZnRfVDoqo0
 bjDWthqnmgcPJd3zzdA==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=6984af64 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=YnUHmWYE1xSIxKmkA7UA:9
 a=CjuIK1q_8ugA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: I8EUAPhsZimw1gMlBmn_920mitREB2xp
X-Proofpoint-GUID: I8EUAPhsZimw1gMlBmn_920mitREB2xp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_065537_091416_A6018A85 
X-CRM114-Status: GOOD (  31.78  )
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

On Thu, Feb 05, 2026 at 09:28:08AM +0800, fangyu.yu@linux.alibaba.com wrote:
> >> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> 
> >> Add a VM capability that allows userspace to select the G-stage page table
> >> format by setting HGATP.MODE on a per-VM basis.
> >> 
> >> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> >> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> >> not supported by the host, and with -EBUSY if the VM has already been
> >> committed (e.g. vCPUs have been created or any memslot is populated).
> >> 
> >> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> >> HGATP.MODE formats supported by the host.
> >> 
> >> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> ---
> >>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
> >>  arch/riscv/kvm/vm.c            | 19 +++++++++++++++++--
> >>  include/uapi/linux/kvm.h       |  1 +
> >>  3 files changed, 45 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> >> index 01a3abef8abb..62dc120857c1 100644
> >> --- a/Documentation/virt/kvm/api.rst
> >> +++ b/Documentation/virt/kvm/api.rst
> >> @@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
> >>  This capability can be enabled dynamically even if VCPUs were already
> >>  created and are running.
> >>  
> >> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> >> +---------------------------------
> >> +
> >> +:Architectures: riscv
> >> +:Type: VM
> >> +:Parameters: args[0] contains the requested HGATP mode
> >> +:Returns:
> >> +  - 0 on success.
> >> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> >> +    hardware.
> >> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> >> +    non-empty memslots.
> >> +
> >
> >Currently the documentation for KVM_SET_ONE_REG has this for EBUSY
> >
> >  EBUSY    (riscv) changing register value not allowed after the vcpu
> >           has run at least once
> >
> >I suggest we update the KVM_SET_ONE_REG EBUSY description to say
> >
> >(riscv) changing register value not allowed. This may occur after the vcpu
> >has run at least once or when other setup has completed which depends on
> >the value of the register.
> 
> Thanks for the suggestion.
> 
> In this series the HGATP mode is configured via KVM_ENABLE_CAP at the VM level
> (kvm_vm_ioctl_enable_cap), not via KVM_SET_ONE_REG. Updating the KVM_SET_ONE_REG
> -EBUSY description might be misleading since it is vCPU one-reg specific and not
> directly related to this series.

Oh, right. I'm so used to adding registers I forgot we're only adding a
cap...

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
